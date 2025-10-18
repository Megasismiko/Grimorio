using System;
using System.Collections.Generic;

namespace Grimorio.Model;

public partial class Set
{
    public int IdSet { get; set; }

    public string? Nombre { get; set; }

    public string? Tipo { get; set; }

    public string? Codigo { get; set; }

    public DateTime? FechaSalida { get; set; }

    public string? Logo { get; set; }

    public bool? EsActivo { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public string? Color {  get; set; }

    public virtual ICollection<Carta> Cartas { get; set; } = [];
}
