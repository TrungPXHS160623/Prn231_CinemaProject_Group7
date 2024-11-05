using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Prn231_CinemaProject_Group7.Models
{
    public partial class Prn231_Project_FinalContext : DbContext
    {
        public Prn231_Project_FinalContext()
        {
        }

        public Prn231_Project_FinalContext(DbContextOptions<Prn231_Project_FinalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Concession> Concessions { get; set; } = null!;
        public virtual DbSet<Coupon> Coupons { get; set; } = null!;
        public virtual DbSet<Employee> Employees { get; set; } = null!;
        public virtual DbSet<GiftCard> GiftCards { get; set; } = null!;
        public virtual DbSet<Movie> Movies { get; set; } = null!;
        public virtual DbSet<MovieReview> MovieReviews { get; set; } = null!;
        public virtual DbSet<News> News { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderConcession> OrderConcessions { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<OrderStatus> OrderStatuses { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Room> Rooms { get; set; } = null!;
        public virtual DbSet<Seat> Seats { get; set; } = null!;
        public virtual DbSet<SeatType> SeatTypes { get; set; } = null!;
        public virtual DbSet<Showtime> Showtimes { get; set; } = null!;
        public virtual DbSet<Theater> Theaters { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfiguration config = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", true, true)
                .Build();
                var strConn = config["ConnectionStrings:MyDatabase"];
                optionsBuilder.UseSqlServer(strConn);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryName).HasMaxLength(255);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Concession>(entity =>
            {
                entity.HasKey(e => e.ProductId)
                    .HasName("PK__Concessi__B40CC6CD698920D9");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.ProductName).HasMaxLength(255);

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Coupon>(entity =>
            {
                entity.Property(e => e.Code).HasMaxLength(50);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Discount).HasColumnType("decimal(5, 2)");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasIndex(e => e.Email, "UQ__Employee__A9D10534DA2E3FE2")
                    .IsUnique();

                entity.Property(e => e.Address).HasMaxLength(255);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.FullName).HasMaxLength(255);

                entity.Property(e => e.HireDate).HasColumnType("date");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.JobTitle).HasMaxLength(100);

                entity.Property(e => e.Phone).HasMaxLength(15);

                entity.Property(e => e.Salary).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<GiftCard>(entity =>
            {
                entity.Property(e => e.Balance).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.Code).HasMaxLength(50);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Movie>(entity =>
            {
                entity.Property(e => e.AgeRating).HasMaxLength(50);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Director).HasMaxLength(255);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.Language).HasMaxLength(100);

                entity.Property(e => e.ReleaseDate).HasColumnType("date");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasMany(d => d.Categories)
                    .WithMany(p => p.Movies)
                    .UsingEntity<Dictionary<string, object>>(
                        "MovieCategory",
                        l => l.HasOne<Category>().WithMany().HasForeignKey("CategoryId").HasConstraintName("FK__Movie_Cat__Categ__6B24EA82"),
                        r => r.HasOne<Movie>().WithMany().HasForeignKey("MovieId").HasConstraintName("FK__Movie_Cat__Movie__6C190EBB"),
                        j =>
                        {
                            j.HasKey("MovieId", "CategoryId").HasName("PK__Movie_Ca__EA4207BA951FE84A");

                            j.ToTable("Movie_Categories");
                        });
            });

            modelBuilder.Entity<MovieReview>(entity =>
            {
                entity.HasKey(e => e.ReviewId)
                    .HasName("PK__MovieRev__74BC79CE4909BE5D");

                entity.HasIndex(e => new { e.MovieId, e.CustomerId, e.ReviewDate }, "UQ_Customer_Movie")
                    .IsUnique();

                entity.Property(e => e.ReviewDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.MovieReviews)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__MovieRevi__Custo__6D0D32F4");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.MovieReviews)
                    .HasForeignKey(d => d.MovieId)
                    .HasConstraintName("FK__MovieRevi__Movie__6E01572D");
            });

            modelBuilder.Entity<News>(entity =>
            {
                entity.Property(e => e.Author).HasMaxLength(255);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.PublishedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.IsPaid).HasDefaultValueSql("((0))");

                entity.Property(e => e.OrderDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.PaymentMethod).HasMaxLength(50);

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Coupon)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CouponId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Orders__CouponId__73BA3083");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__Orders__Customer__74AE54BC");

                entity.HasOne(d => d.GiftCard)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.GiftCardId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Orders__GiftCard__75A278F5");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Orders__StatusId__76969D2E");
            });

            modelBuilder.Entity<OrderConcession>(entity =>
            {
                entity.ToTable("Order_Concessions");

                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Concession)
                    .WithMany(p => p.OrderConcessions)
                    .HasForeignKey(d => d.ConcessionId)
                    .HasConstraintName("FK__Order_Con__Conce__6EF57B66");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderConcessions)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK__Order_Con__Order__6FE99F9F");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK__OrderDeta__Order__70DDC3D8");

                entity.HasOne(d => d.Seat)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.SeatId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__SeatI__71D1E811");

                entity.HasOne(d => d.Showtime)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ShowtimeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__OrderDeta__Showt__72C60C4A");
            });

            modelBuilder.Entity<OrderStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId)
                    .HasName("PK__Order_St__C8EE2063C3B95D56");

                entity.ToTable("Order_Status");

                entity.Property(e => e.StatusName).HasMaxLength(50);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleName).HasMaxLength(255);
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.Name).HasMaxLength(100);

                entity.HasOne(d => d.Theater)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.TheaterId)
                    .HasConstraintName("FK__Rooms__TheaterId__778AC167");
            });

            modelBuilder.Entity<Seat>(entity =>
            {
                entity.Property(e => e.IsAvailable).HasDefaultValueSql("((1))");

                entity.Property(e => e.RowName).HasMaxLength(5);

                entity.Property(e => e.SeatNumber).HasMaxLength(10);

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Seats)
                    .HasForeignKey(d => d.RoomId)
                    .HasConstraintName("FK__Seats__RoomId__787EE5A0");

                entity.HasOne(d => d.SeatType)
                    .WithMany(p => p.Seats)
                    .HasForeignKey(d => d.SeatTypeId)
                    .HasConstraintName("FK__Seats__SeatTypeI__797309D9");
            });

            modelBuilder.Entity<SeatType>(entity =>
            {
                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.TypeName).HasMaxLength(100);
            });

            modelBuilder.Entity<Showtime>(entity =>
            {
                entity.Property(e => e.EndTime).HasColumnType("datetime");

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.StartTime).HasColumnType("datetime");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.Showtimes)
                    .HasForeignKey(d => d.MovieId)
                    .HasConstraintName("FK__Showtimes__Movie__7A672E12");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.Showtimes)
                    .HasForeignKey(d => d.RoomId)
                    .HasConstraintName("FK__Showtimes__RoomI__7B5B524B");
            });

            modelBuilder.Entity<Theater>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(255);

                entity.Property(e => e.ClosingHour).HasMaxLength(100);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.Name).HasMaxLength(100);

                entity.Property(e => e.OpeningHour).HasMaxLength(100);

                entity.Property(e => e.Phone).HasMaxLength(15);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.CustomerId)
                    .HasName("PK__Users__A4AE64D83400182D");

                entity.HasIndex(e => e.Email, "UQ__Users__A9D105348B435CD1")
                    .IsUnique();

                entity.Property(e => e.City).HasMaxLength(100);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email).HasMaxLength(255);

                entity.Property(e => e.FirstName).HasMaxLength(100);

                entity.Property(e => e.IsActive).HasDefaultValueSql("((1))");

                entity.Property(e => e.LastName).HasMaxLength(100);

                entity.Property(e => e.Phone).HasMaxLength(15);

                entity.Property(e => e.UpdatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
