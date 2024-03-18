import { LightningElement } from 'lwc';

export default class HelloParentComponent extends LightningElement {

    userNames = ["mia","john","nik","lucy","tk"]

    fetchDetailHandler(){
        let elem = this.template.querySelector('h1')
        elem.style.border = "1px solid red"
        console.log(elem.innerText);
        let userElement = this.template.querySelectorAll('.name')
        Array.from(userElement).forEach(element => {
            element.setAttribute('title',element.innerText)
            console.log(element.innerText);
        });

        //lwc:dom child element
        let childElem = this.template.querySelector('.child')
        childElem.innerHTML = "<p>Hi I'm a child!</p>"
    }
}