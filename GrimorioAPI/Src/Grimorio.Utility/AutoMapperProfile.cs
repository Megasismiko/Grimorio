using Grimorio.DTO;
using Grimorio.Model;
using AutoMapper;
using System.Globalization;

namespace Grimorio.Utility
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            #region ROL
            CreateMap<Rol, RolDTO>().ReverseMap();

            #endregion

            #region MENU
            CreateMap<Menu, MenuDTO>().ReverseMap();
            #endregion

            #region USUARIO
            CreateMap<Usuario, UsuarioDTO>()
                .ForMember(
                    destino => destino.RolDescripcion,
                    opt => opt.MapFrom(origen => origen.IdRolNavigation.Nombre)
                );


            CreateMap<Usuario, SesionDTO>()
                .ForMember(
                    destino => destino.RolDescripcion,
                    opt => opt.MapFrom(origen => origen.IdRolNavigation.Nombre)
                );

            CreateMap<UsuarioDTO, Usuario>()
                .ForMember(
                    destino => destino.IdRolNavigation,
                    opt => opt.Ignore()
                );

            #endregion

            #region SET
            CreateMap<Set, SetDTO>().ReverseMap();
            #endregion

            #region CARTA
            CreateMap<Carta, CartaDTO>()
                .ForMember(
                    destino => destino.DescripcionSet,
                    opt => opt.MapFrom(origen => origen.IdSetNavigation.Nombre)
                ).ForMember(
                    destino => destino.Precio,
                    opt => opt.MapFrom(origen => Convert.ToString(origen.Precio.Value, Culture.Current))
                );


            CreateMap<CartaDTO, Carta>()
               .ForMember(
                   destino => destino.IdSetNavigation,
                   opt => opt.Ignore()
               ).ForMember(
                   destino => destino.Precio,
                   opt => opt.MapFrom(origen => Convert.ToDecimal(origen.Precio, Culture.Current))
               );
            #endregion

            #region VENTA
            CreateMap<Venta, VentaDTO>()
                .ForMember(
                   destino => destino.TotalTexto,
                   opt => opt.MapFrom(origen => Convert.ToString(origen.Total.Value, Culture.Current))
                ).ForMember(
                   destino => destino.FechaRegistro,
                   opt => opt.MapFrom(origen => origen.FechaRegistro.Value.ToString(Culture.FormatoFecha))
                );

            CreateMap<VentaDTO, Venta>()
              .ForMember(
                 destino => destino.Total,
                 opt => opt.MapFrom(origen => Convert.ToDecimal(origen.TotalTexto, Culture.Current))
              );
            //.ForMember(
            //   destino => destino.FechaRegistro,
            //   opt => opt.MapFrom(origen => Convert.ToDateTime(origen.FechaRegistro))
            //);
            #endregion

            #region DETALLE VENTA
            CreateMap<DetalleVenta, DetalleVentaDTO>()
                .ForMember(
                    destino => destino.DescripcionCarta,
                    opt => opt.MapFrom(origen => origen.IdCartaNavigation.Nombre)
                ).ForMember(
                    destino => destino.PrecioTexto,
                    opt => opt.MapFrom(origen => Convert.ToString(origen.Precio.Value, Culture.Current))
                ).ForMember(
                    destino => destino.TotalTexto,
                    opt => opt.MapFrom(origen => Convert.ToString(origen.Total.Value, Culture.Current))
                );

            CreateMap<DetalleVentaDTO, DetalleVenta>()
               .ForMember(
                   destino => destino.Precio,
                   opt => opt.MapFrom(origen => Convert.ToDecimal(origen.PrecioTexto, Culture.Current))
               ).ForMember(
                   destino => destino.Total,
                   opt => opt.MapFrom(origen => Convert.ToDecimal(origen.TotalTexto, Culture.Current))
               );
            #endregion

            #region REPORTE
            CreateMap<DetalleVenta, ReporteDTO>()
                .ForMember(
                    destino => destino.FechaRegistro,
                    opt => opt.MapFrom(origen => origen.IdVentaNavigation.FechaRegistro.Value.ToString(Culture.FormatoFecha))
                ).ForMember(
                    destino => destino.NumeroDocumento,
                    opt => opt.MapFrom(origen => origen.IdVentaNavigation.NumeroDocumento)
                ).ForMember(
                    destino => destino.TipoPago,
                    opt => opt.MapFrom(origen => origen.IdVentaNavigation.TipoPago)
                ).ForMember(
                   destino => destino.TotalVenta,
                   opt => opt.MapFrom(origen => Convert.ToString(origen.IdVentaNavigation.Total.Value, Culture.Current))
                ).ForMember(
                    destino => destino.Carta,
                    opt => opt.MapFrom(origen => origen.IdCartaNavigation.Nombre)
                ).ForMember(
                   destino => destino.Precio,
                   opt => opt.MapFrom(origen => Convert.ToString(origen.Precio.Value, Culture.Current))
                ).ForMember(
                   destino => destino.Total,
                   opt => opt.MapFrom(origen => Convert.ToString(origen.Total.Value, Culture.Current))
                );


            #endregion

        }
    }
}
