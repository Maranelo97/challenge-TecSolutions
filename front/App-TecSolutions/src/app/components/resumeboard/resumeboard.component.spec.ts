import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumeboardComponent } from './resumeboard.component';

describe('ResumeboardComponent', () => {
  let component: ResumeboardComponent;
  let fixture: ComponentFixture<ResumeboardComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ResumeboardComponent]
    });
    fixture = TestBed.createComponent(ResumeboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
