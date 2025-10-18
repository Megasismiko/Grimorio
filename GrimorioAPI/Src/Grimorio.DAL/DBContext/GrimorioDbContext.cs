using Grimorio.Model;
using Microsoft.EntityFrameworkCore;

namespace Grimorio.DAL.DBContext;

    public partial class GrimorioDbContext : DbContext
{
    public GrimorioDbContext()
    {
    }

    public GrimorioDbContext(DbContextOptions<GrimorioDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Carta> Cartas { get; set; }

    public virtual DbSet<DetalleVenta> DetalleVenta { get; set; }

    public virtual DbSet<Menu> Menus { get; set; }

    public virtual DbSet<MenuRol> MenuRols { get; set; }

    public virtual DbSet<NumeroDocumento> NumeroDocumentos { get; set; }

    public virtual DbSet<Rol> Rols { get; set; }

    public virtual DbSet<Set> Sets { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    public virtual DbSet<Venta> Venta { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Carta>(entity =>
        {
            entity.HasKey(e => e.IdCarta).HasName("PK__Cartas__6C9FD04FF6B0DF4B");
            entity.Property(e => e.Artista).HasMaxLength(100).IsUnicode(false);
            entity.Property(e => e.Coste).HasMaxLength(20).IsUnicode(false);
            entity.Property(e => e.EsActivo).HasDefaultValue(true);
            entity.Property(e => e.FechaRegistro).HasDefaultValueSql("(getdate())").HasColumnType("datetime");
            entity.Property(e => e.ImagenUrl).HasMaxLength(500).IsUnicode(false);
            entity.Property(e => e.Nombre).HasMaxLength(100).IsUnicode(false);
            entity.Property(e => e.Numero).HasMaxLength(10).IsUnicode(false);
            entity.Property(e => e.Poder).HasMaxLength(5).IsUnicode(false);
            entity.Property(e => e.Precio).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Rareza).HasMaxLength(50).IsUnicode(false);
            entity.Property(e => e.Resistencia).HasMaxLength(5).IsUnicode(false);
            entity.Property(e => e.Texto).IsUnicode(false);
            entity.Property(e => e.Tipo).HasMaxLength(100).IsUnicode(false);           
        });

        modelBuilder.Entity<DetalleVenta>(entity =>
        {
            entity.HasKey(e => e.IdDetalleVenta).HasName("PK__DetalleV__AAA5CEC2939D3A95");
            entity.Property(e => e.Precio).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.Total).HasColumnType("decimal(10, 2)");
            entity.HasOne(d => d.IdCartaNavigation).WithMany(p => p.DetalleVenta)
                .HasForeignKey(d => d.IdCarta)
                .HasConstraintName("FK__DetalleVe__IdCar__5441852A");
            entity.HasOne(d => d.IdVentaNavigation).WithMany(p => p.DetalleVenta)
                .HasForeignKey(d => d.IdVenta)
                .HasConstraintName("FK__DetalleVe__IdVen__534D60F1");
        });

        modelBuilder.Entity<Menu>(entity =>
        {
            entity.HasKey(e => e.IdMenu).HasName("PK__Menu__4D7EA8E12E912A71");

            entity.ToTable("Menu");

            entity.Property(e => e.Icono)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Url)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MenuRol>(entity =>
        {
            entity.HasKey(e => e.IdMenuRol).HasName("PK__MenuRol__F8D2D5B6F30BD4C1");

            entity.ToTable("MenuRol");

            entity.HasOne(d => d.IdMenuNavigation).WithMany(p => p.MenuRols)
                .HasForeignKey(d => d.IdMenu)
                .HasConstraintName("FK__MenuRol__IdMenu__3C69FB99");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.MenuRols)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__MenuRol__IdRol__3D5E1FD2");
        });

        modelBuilder.Entity<NumeroDocumento>(entity =>
        {
            entity.HasKey(e => e.IdNumeroDocumento).HasName("PK__NumeroDo__6DFF4A6CA4CB5E1C");

            entity.ToTable("NumeroDocumento");

            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<Rol>(entity =>
        {
            entity.HasKey(e => e.IdRol).HasName("PK__Rol__2A49584CE7283804");

            entity.ToTable("Rol");

            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Set>(entity =>
        {
            entity.HasKey(e => e.IdSet).HasName("PK__Sets__2B0426383A027871");

            entity.Property(e => e.Codigo).HasMaxLength(5).IsUnicode(false);
            entity.HasIndex(e => e.Codigo).IsUnique(); // opcional recomendado

            entity.Property(e => e.Color).HasMaxLength(7).IsUnicode(false).HasDefaultValue("#C2A878");
            entity.Property(e => e.EsActivo).HasDefaultValue(true);
            entity.Property(e => e.FechaRegistro).HasDefaultValueSql("(getdate())").HasColumnType("datetime");
            entity.Property(e => e.FechaSalida).HasColumnType("datetime");
            entity.Property(e => e.Logo).HasMaxLength(500).IsUnicode(false);
            entity.Property(e => e.Nombre).HasMaxLength(50).IsUnicode(false);
            entity.Property(e => e.Tipo).HasMaxLength(100).IsUnicode(false);

            
            entity.HasMany(s => s.Cartas)
                  .WithOne(c => c.IdSetNavigation)
                  .HasForeignKey(c => c.IdSet)
                  .IsRequired()                    
                  .OnDelete(DeleteBehavior.Cascade);
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.IdUsuario).HasName("PK__Usuario__5B65BF97FDE1BE50");

            entity.ToTable("Usuario");

            entity.Property(e => e.Clave)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.Correo)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.EsActivo).HasDefaultValue(true);
            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NombreCompleto)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__Usuario__IdRol__403A8C7D");
        });

        modelBuilder.Entity<Venta>(entity =>
        {
            entity.HasKey(e => e.IdVenta).HasName("PK__Venta__BC1240BDC40641CF");

            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NumeroDocumento)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.TipoPago)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Total).HasColumnType("decimal(10, 2)");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}



