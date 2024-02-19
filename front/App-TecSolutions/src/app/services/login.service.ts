import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  private apiUrl = `${environment.apiUrl}/login`;

  userDataSubject = new BehaviorSubject<any>(this.getUserDataFromStorage());
  userData$: Observable<any> = this.userDataSubject.asObservable();

  constructor(private http: HttpClient) { }

  login(email: string, password: string): Observable<any> {
    const credentials = { email: email, password: password };

    return this.http.post(this.apiUrl, credentials)
      .pipe(
        tap((userData) => {
          this.userDataSubject.next(userData);
          this.saveUserDataToStorage(userData);
        })
      );
  }

  saveUserDataToStorage(userData: any): void {
    localStorage.setItem('userData', JSON.stringify(userData));
  }

  getUserDataFromStorage(): any {
    const storedUserData = localStorage.getItem('userData');
    return storedUserData ? JSON.parse(storedUserData) : null;
  }
}
