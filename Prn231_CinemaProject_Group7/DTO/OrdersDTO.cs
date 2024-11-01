﻿using Prn231_CinemaProject_Group7.Models;

namespace Prn231_CinemaProject_Group7.DTO
{
    public class OrderDTO
    {
        public int CustomerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public bool? IsPaid { get; set; }
        public string PaymentMethod { get; set; } = null!;
        public int StatusId { get; set; }
        public int? CouponId { get; set; }
        public int? GiftCardId { get; set; }
        public virtual ICollection<OrderConcession> OrderConcessions { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
    public class OrderSummaryDTO
    {
        public int OrderId { get; set; }
        public CustomerInfoDTO Customer { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal TotalAmount { get; set; }
        public bool? IsPaid { get; set; }
        public string PaymentMethod { get; set; } = null!;
        public OrderStatusDTO Status { get; set; }
        public CouponInfoDTO? Coupon { get; set; }
        public GiftCardInfoDTO? GiftCard { get; set; }
        public List<OrderConcessionInfoDTO> OrderConcessions { get; set; } = new();
        public List<OrderDetailInfoDTO> OrderDetails { get; set; } = new();
    }

    public class CustomerInfoDTO
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }

    public class OrderStatusDTO
    {
        public string StatusName { get; set; }
    }

    public class CouponInfoDTO
    {
        public decimal Discount { get; set; }
    }

    public class GiftCardInfoDTO
    {
        public decimal Balance { get; set; }
    }

    public class OrderConcessionInfoDTO
    {
        public ConcessionInfoDTO Concession { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }

    public class ConcessionInfoDTO
    {
        public string ProductName { get; set; }
    }

    public class OrderDetailInfoDTO
    {
        public ShowtimeInfoDTO Showtime { get; set; }
        public SeatInfoDTO Seat { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }

    public class ShowtimeInfoDTO
    {
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
    }

    public class SeatInfoDTO
    {
        public string SeatNumber { get; set; }
        public RoomInfoDTO Room { get; set; }
    }

    public class RoomInfoDTO
    {
        public string Name { get; set; }
        public TheaterInfoDTO Theater { get; set; }
    }

    public class TheaterInfoDTO
    {
        public string Name { get; set; }
    }
}
