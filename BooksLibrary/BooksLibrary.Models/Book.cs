using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BooksLibrary.Models
{
    public class Book
    {
        private ICollection<Comment> comments;

        public Book()
        {
            this.comments = new HashSet<Comment>();
        }

        public int Id { get; set; }

        [Required]
        [MinLength(1)]
        [MaxLength(50)]
        public string Title { get; set; }

        [Required]
        [MinLength(5)]
        [MaxLength(500)]
        public string Description { get; set; }

        public string FileUrl { get; set; }

        [Required]
        public DateTime DateAdded { get; set; }

        public int AuthorId { get; set; }

        public virtual Author Author { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public int NumberOfReads { get; set; }

        public virtual ICollection<Comment> Comments
        {
            get { return this.comments; }
            set { this.comments = value; }
        }
    }
}
