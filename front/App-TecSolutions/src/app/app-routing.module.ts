import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '../app/auth.guard'
import { LoginPageComponent } from './login-page/login-page.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { BooksTableComponent } from './components/books-table/books-table.component';
import { ReservasTableComponent } from './components/reservas-table/reservas-table.component';

const routes: Routes = [
  { path: "", component: LoginPageComponent, pathMatch: "full" },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'booksTable', component: BooksTableComponent, canActivate: [AuthGuard] },
  { path: 'reservasTable', component: ReservasTableComponent, canActivate: [AuthGuard] }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
