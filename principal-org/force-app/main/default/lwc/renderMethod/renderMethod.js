import { LightningElement } from 'lwc';
import signinTemplate from './signinTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderMethod from './renderMethod.html';

export default class RenderMethod extends LightningElement {
    selectedBtn = '';

    render(){
        return this.selectedBtn === 'Signup' ? signupTemplate :
            this.selectedBtn === 'Signin' ? signinTemplate :
            renderMethod;
    }

    handlerClick(event){
        this.selectedBtn = event.target.label;
        console.log(this.selectedBtn)
    }

    submitHandler(event){
        console.log(`${event.target.label} successfuly!!`)
    }
}