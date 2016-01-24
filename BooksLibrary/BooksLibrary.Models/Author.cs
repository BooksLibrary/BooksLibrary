using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BooksLibrary.Models
{
    public class Author
    {
        private ICollection<Book> books;

        public Author()
        {
            this.books = new HashSet<Book>();
        }

        public int Id { get; set; }

        [Required]
        [MinLength(1)]
        [MaxLength(200)]
        public string Name { get; set; }

        [MinLength(5)]
        [MaxLength(500)]
        public string Info { get; set; }
                
        public string ImageUrl { get; set; }

        public virtual ICollection<Book> Books
        {
            get { return this.books; }
            set { this.books = value; }
        }
    }
}