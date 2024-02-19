import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

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
    const apiUrl = `${environment.apiUrl}/libros`;

    this.http.get(apiUrl).subscribe(
      (response: any) => {
        this.books = response;
      },
      (error) => {
        console.error('Error al obtener libros', error);
      }
    );
  }



  reserveBook(book: any): void {
    const apiUrl = `${environment.apiUrl}/reservas/prestar/${book.id}/1`; // Asumiendo que '1' es el usuarioId harcodeado

    this.http.post(apiUrl, {}).subscribe(
      () => {
        this.fetchBooks();
      },
      (error) => {
        console.error('Error al realizar la reserva', error);
      }
    );
  }
}
