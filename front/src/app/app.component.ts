import { Component, OnInit } from '@angular/core';
import { Http, Response, Headers, RequestOptions }    from '@angular/http';

import { Observable } from 'rxjs/Observable';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'app works!';
  constructor (private http: Http) {}
  password: string = btoa('password');
  email: string = 'm@e.com';
  user: Observable<any> = null;

  login() {
    this.http.get('http://localhost:3000/users/1?email=' + this.email + '&password=' + this.password).subscribe(i => this.user = i.json());
  }
  signup() {
    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers: headers });
    console.log('sent')
    this.http.post('http://localhost:3000/users', { 'email':'email@email.com', 'password': btoa('password'), 'first_name': 'Andrew', 'last_name': 'Accuardi'}, options).subscribe(res => console.log(res.json()));
  }
  ngOnInit() {
    this.login();
  }
}
