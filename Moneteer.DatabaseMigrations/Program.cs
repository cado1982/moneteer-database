using DbUp;
using System;
using System.Reflection;

namespace Moneteer.DatabaseMigrations
{
    class Program
    {
        static int Main(string[] args)
        {
            var connectionString = "Server=127.0.0.1;User Id=postgres;Password=admin;Database=moneteer-app;";

            var upgrader =
                DeployChanges.To
                    .PostgresqlDatabase(connectionString)
                    .WithTransaction()
                    .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                    .LogToConsole()
                    .Build();

            var result = upgrader.PerformUpgrade();

            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
#if DEBUG
                Console.ReadLine();
#endif
                return -1;
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();

#if DEBUG
            Console.ReadLine();
#endif

            return 0;
        }
    }
}
