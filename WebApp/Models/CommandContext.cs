using Microsoft.EntityFrameworkCore;

namespace WebApp.Models
{
    public class CommandContext:DbContext
    {
        public CommandContext(DbContextOptions<CommandContext> options) : base (options)
        {}
        public DbSet<Command> CommandItems{get;set;} //This string will create Database with table in Microsoft SQL Server with the 
    }                                                //....help of Startup.cs command
}                                                   /*services.AddDbContext<CommandContext>
                                                        (opt=>opt.UseSqlServer(Configuration["Data:CommandAPIConnection:ConnectionString"]));*/