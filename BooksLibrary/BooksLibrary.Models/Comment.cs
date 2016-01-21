using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BooksLibrary.Models
{
    public class Comment
    {
        public int Id { get; set; }

        [Required]
        [MinLength(2)]
        [MaxLength(200)]
        public string Content { get; set; }

        public int UserId { get; set; }

        public virtual User User{ get; set; }

        public int BookId { get; set; }

        public virtual Book Book { get; set; }

        [Required]
        public DateTime Date { get; set; }
    }
}
