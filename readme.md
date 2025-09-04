### Readme

dotnet add package Datadog.Trace.Bundle --version 3.25.0

dotnet add package Datadog.Trace --version 3.25.0

dotnet tool install --global dd-trace --version 3.25.0


dotnet bin/Debug/net9.0/dd-apm-nuget.dll

CORECLR_ENABLE_PROFILING=1 CORECLR_PROFILER='{846F5F1C-F9AE-4B07-969E-05C26BC060D8}' CORECLR_PROFILER_PATH='/Users/oluwaseye.ayinla/Projects/Applications/dotnet/dd-apm-nuget/bin/Debug/net9.0/datadog/osx/Datadog.Trace.ClrProfiler.Native.dylib' DD_DOTNET_TRACER_HOME='/Users/oluwaseye.ayinla/Projects/Applications/dotnet/dd-apm-nuget/bin/Debug/net9.0/datadog' dotnet bin/Debug/net9.0/dd-apm-nuget.dll

Bin
////
CORECLR_ENABLE_PROFILING=1 CORECLR_PROFILER={846F5F1C-F9AE-4B07-969E-05C26BC060D8} CORECLR_PROFILER_PATH=/app/datadog/osx-x64/Datadog.Trace.ClrProfiler.Native.dylib" DD_DOTNET_TRACER_HOME=/app/datadog DD_TRACE_AGENT_PORT=8136 dd-trace run -- dotnet dd-apm-nuget.dll


---

Updated the readme

  "DD_GIT_COMMIT_SHA": "674711b2ac208427157e50c35299f656847117f9",
  "DD_GIT_REPOSITORY_URL": "https://github.com/oluwaseyeayinla/dd-apm-nuget"