import { LightningElement, api } from 'lwc';

export default class SetterDemoChild extends LightningElement {

    userDetailCopy

    @api
    get detail(){
        return this.userDetailCopy
    }

    set detail(data){
        this.userDetailCopy = {...data,
            name: data.name, 
            age: data.age,
            "location":"RJ"}
    }
}