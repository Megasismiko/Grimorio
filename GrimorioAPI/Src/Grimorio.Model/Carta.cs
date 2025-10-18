namespace Grimorio.Model;

public partial class Carta
{
    public int IdCarta { get; set; }

    public string? Nombre { get; set; }

    public string? Coste { get; set; }

    public string? Tipo { get; set; }

    public string? Rareza { get; set; }

    public string? Texto { get; set; }

    public string? Artista { get; set; }

    public string? Numero { get; set; }

    public string? Poder { get; set; }

    public string? Resistencia { get; set; }

    public string? ImagenUrl { get; set; }

    public int IdSet { get; set; }

    public int? Stock { get; set; }

    public decimal? Precio { get; set; }

    public bool? EsActivo { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public virtual ICollection<DetalleVenta> DetalleVenta { get; set; } = new List<DetalleVenta>();

    public virtual Set? IdSetNavigation { get; set; }
}
