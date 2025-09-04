# Use the official .NET SDK image for build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY dd-apm-nuget.csproj ./
RUN dotnet restore .

# Copy the rest of the source code
COPY . ./

# Build the application
RUN dotnet publish -c Release -o /app/dd-apm-nuget 
#--no-restore

# Use the official ASP.NET runtime image for the final container
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final

WORKDIR /app/dd-apm-nuget 

ENV ASPNETCORE_URLS="http://+:8080"

ENV CORECLR_ENABLE_PROFILING=1
# ENV CORECLR_PROFILER={846F5F1C-F9AE-4B07-969E-05C26BC060D8}
# ENV CORECLR_PROFILER_PATH=/app/dd-apm-nuget/datadog/linux-arm64/Datadog.Trace.ClrProfiler.Native.so
ENV DD_DOTNET_TRACER_HOME=/app/dd-apm-nuget/datadog

# Copy the published output from the build stage
COPY --from=build /app/dd-apm-nuget ./

# Create log directory via the inbuilt script
RUN /app/dd-apm-nuget/datadog/createLogPath.sh
# # Create the log directory manually
# RUN mkdir -p /var/log/datadog/dotnet
# RUN chmod a+rwx /var/log/datadog/dotnet

# Add the dd-donet command to the PATH via the inbuilt script
# RUN /app/dd-apm-nuget/datadog/dd-dotnet.sh

# Expose port 80
EXPOSE 8080

# Set the entrypoint
ENTRYPOINT ["dotnet", "dd-apm-nuget.dll"]