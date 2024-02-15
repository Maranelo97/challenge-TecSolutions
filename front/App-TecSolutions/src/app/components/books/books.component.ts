import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-books',
  templateUrl: './books.component.html',
  styleUrls: ['./books.component.css']
})
export class BooksComponent {
  books: any[] = [];
  isBookReserved(book: any): boolean {
    return book.delivered === 1;
  }

  constructor(private http: HttpClient) {
    this.fetchBooks();
  }

  private fetchBooks(): void {
    const apiUrl = 'http://127.0.0.1:8000/api/libros';

    this.http.get(apiUrl).subscribe(
      (response: any) => {
        console.log(response)
        this.books = response;
      },
      (error) => {
        console.error('Error al obtener libros', error);
      }
    );
  }
}
