import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { FooterMainComponent } from './footer-main/footer-main.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ResumeboardComponent } from './components/resumeboard/resumeboard.component';
import { BooksComponent } from './components/books/books.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    FooterMainComponent,
    DashboardComponent,
    ResumeboardComponent,
    BooksComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
