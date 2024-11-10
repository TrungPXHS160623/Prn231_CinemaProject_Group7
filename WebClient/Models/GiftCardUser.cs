namespace WebClient.Models
{
    public class GiftCardUser
    {
        public int GiftCardId { get; set; }
        public int UserId { get; set; }
        public DateTime? CreateAt { get; set; }
        public DateTime? UpdateAt { get; set; }
        public bool? IsActive { get; set; }
        public virtual GiftCard GiftCard { get; set; } = null!;
        public virtual User User { get; set; } = null!;
    }
}
