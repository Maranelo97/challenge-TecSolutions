import { Component } from '@angular/core';
import { LoginService } from '../services/login.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent {

  showErrToast: boolean = false;
  email: string = '';
  password: string = '';

  constructor(private loginService: LoginService, private router: Router) { }
  login(username: string, password: string): void {
    this.loginService.login(username, password).subscribe(
      (response) => {
        console.log(response)
        this.router.navigate(['/dashboard']);
      },
      (error) => {
        this.showErrToast = true;
        console.error('Error en el login', error);
      }
    );
  }


  closeToast(): void {
    this.showErrToast = false; // Cierra el Toast al hacer clic en el botón cerrar
  }
}
