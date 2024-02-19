import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MatIconModule } from '@angular/material/icon';
import { ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { FooterMainComponent } from './footer-main/footer-main.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ResumeboardComponent } from './components/resumeboard/resumeboard.component';
import { BooksComponent } from './components/books/books.component';
import { BooksTableComponent } from './components/books-table/books-table.component';
import { ReservasTableComponent } from './components/reservas-table/reservas-table.component';




@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    FooterMainComponent,
    DashboardComponent,
    ResumeboardComponent,
    BooksComponent,
    BooksTableComponent,
    ReservasTableComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    MatIconModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
