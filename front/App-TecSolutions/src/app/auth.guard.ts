import { Injectable } from '@angular/core';
import {  ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LoginService } from './services/login.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard {

  constructor(private router: Router, private loginService: LoginService) {  }

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {


    const storedUserData = this.loginService.getUserDataFromStorage();
    if (storedUserData) {

      this.loginService.userDataSubject.next(storedUserData);
      return true;
    }

    // Si el usuario no está autenticado, redirige a la página de inicio de sesión
    this.router.navigate(['/']);
    return false;
  }
}
