import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { environment } from 'src/environments/environment';
import { Book } from 'src/app/interfaces/Book';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-books-table',
  templateUrl: './books-table.component.html',
  styleUrls: ['./books-table.component.css']
})
export class BooksTableComponent implements OnInit {
  books: Book[] = [];
  allBooks: Book[] = [];
  isNavbarCollapsed = true;
  editForm: FormGroup;

  constructor(private http: HttpClient, private fb: FormBuilder) {
    this.editForm = this.fb.group({
      title: ['', Validators.required],
      rating: [0, Validators.required]
    });
  }

  toggleNavbar() {
    this.isNavbarCollapsed = !this.isNavbarCollapsed;
  }

  ngOnInit(): void {
    this.fetchBooks();
  }

  private fetchBooks(): void {
    const apiUrl = `${environment.apiUrl}/libros`;

    this.http.get<Book[]>(apiUrl).subscribe(
      (response: Book[]) => {
        this.allBooks = response;
        this.books = [...this.allBooks];
        console.log(this.books);
      },
      (error) => {
        console.error('Error al obtener libros', error);
      }
    );
  }

  searchBooksByName(event: any): void {
    const searchTerm = event.target.value;

    if (!searchTerm) {
      this.books = [...this.allBooks];
      return;
    }

    this.books = this.allBooks.filter((book) =>
      book.title.toLowerCase().includes(searchTerm.toLowerCase())
    );
  }

  openEditForm(book: Book): void {
    this.editForm.setValue({
      title: book.title || '',
      rating: book.rating || 0
    });

    const formTemplate = `
      <form>
        <div class="form-group">
          <label for="title">Título</label>
          <input type="text" id="title" class="form-control" value="${this.editForm.value.title}">
        </div>
        <div class="form-group">
          <label for="rating">Puntuación</label>
          <input type="number" id="rating" class="form-control" value="${this.editForm.value.rating}">
        </div>
      </form>
    `;

    Swal.fire({
      title: 'Editar Libro',
      html: formTemplate,
      showCancelButton: true,
      confirmButtonText: 'Guardar',
      cancelButtonText: 'Cancelar',
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
    }).then((result) => {
      if (result.isConfirmed) {
        const updatedBook: Book = {
          id: book.id,
          title: this.editForm.value.title,
          rating: this.editForm.value.rating
        };

        const apiUrl = `${environment.apiUrl}/libros/${book.id}`;
        this.http.put(apiUrl, updatedBook).subscribe(
          (response) => {
            console.log('Libro actualizado exitosamente', response);
            this.fetchBooks();
          },
          (error) => {
            console.error('Error al actualizar el libro', error);
            if (error instanceof HttpErrorResponse) {
              console.error('Status:', error.status);
              console.error('Error:', error.error);
            }
          }
        );
      }
    });
  }

  deleteBook(bookId: number): void {
    Swal.fire({
      title: '¿Estás seguro?',
      text: 'Esta acción no se puede deshacer.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Sí, eliminar'
    }).then((result) => {
      if (result.isConfirmed) {
        const apiUrl = `${environment.apiUrl}/libros/${bookId}`;

        this.http.delete(apiUrl).subscribe(
          () => {
            // Actualizar la lista después de la eliminación
            this.fetchBooks();
            Swal.fire('Eliminado', 'El libro ha sido eliminado correctamente', 'success');
          },
          (error) => {
            console.error('Error al eliminar el libro', error);
            Swal.fire('Error', 'Hubo un error al intentar eliminar el libro', 'error');
          }
        );
      }
    });
  }


}
