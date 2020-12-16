using Data.Entities;
using System.Data.Entity;

namespace Data
{
    public class DataContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        public DataContext(string nameOrConnectionString) : base(nameOrConnectionString)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .ToTable("dbo.UsersList");

            base.OnModelCreating(modelBuilder);
        }
    }
}
