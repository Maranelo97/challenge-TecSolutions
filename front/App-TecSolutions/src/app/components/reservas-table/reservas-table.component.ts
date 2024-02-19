import { Component, OnInit } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-reservas-table',
  templateUrl: './reservas-table.component.html',
  styleUrls: ['./reservas-table.component.css']
})
export class ReservasTableComponent implements OnInit {

  reservas: any;
  isNavbarCollapsed = true;

  constructor(private http: HttpClient){
  }

  ngOnInit(): void {
    this.fetchreservas();
  }

  private fetchreservas(): void {
    const apiUrl = `${environment.apiUrl}/reservas`;

    this.http.get(apiUrl).subscribe(
      (response) => {
        this.reservas = response;
        console.log(response);
      },
      (error) => {
        console.error('Error al obtener libros', error);
      }
    );
  }


  toggleNavbar() {
    this.isNavbarCollapsed = !this.isNavbarCollapsed;
  }
}
