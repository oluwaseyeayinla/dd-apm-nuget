// using Datadog.Trace;
// using Datadog.Trace.Configuration;

// read default configuration sources (env vars or datadog.json)
// var settings = TracerSettings.FromDefaultSources();

// // change some settings
// settings.Environment = "prod";
// settings.ServiceName = "In Code Service";
// settings.ServiceVersion = "0.0.1";
// // In v2 of Datadog.Trace, use settings.Exporter.AgentUri
// settings.AgentUri = new Uri("http://localhost:8136/");

// settings.GlobalTags["team"] = "payments";
// Tracer.Configure(settings);

// GlobalSettings.SetDebugEnabled(true);

var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () => "Hello World!");

// app.MapPost("/order/{customerId:int}", async (int customerId) =>
// {
//     using var scope = Tracer.Instance.StartActive("order.place");
//     scope.Span.ResourceName = "POST /order/{customerId}";
//     scope.Span.SetTag("customer.id", customerId.ToString());

//     try
//     {
//       await Task.Delay(25); // simulate work
//       scope.Span.SetTag("result", "ok");
//       return Results.Ok(new { ok = true });
//     }
//     catch (Exception ex)
//     {
//       scope.Span.SetException(ex);
//       throw;
//     }
// });

app.Run();