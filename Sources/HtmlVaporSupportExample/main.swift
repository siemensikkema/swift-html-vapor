import HtmlVaporSupport
import Vapor

let app = try Application(environment: .detect()) { services in
    services.extend(Routes.self) { routes, _ in
        routes.get { _ in
          layout(title: "Home", content: home)
        }

        routes.get("usage") { _ in
          layout(title: "Usage", content: usage)
        }

        routes.get("advanced-usage") { _ in
          layout(title: "Advanced Usage", content: advancedUsage)
        }

        routes.get("installation") { _ in
          layout(title: "Installation", content: installation)
        }
    }
}
try LoggingSystem.bootstrap(from: &app.environment)
try app.boot()
try app.run()
