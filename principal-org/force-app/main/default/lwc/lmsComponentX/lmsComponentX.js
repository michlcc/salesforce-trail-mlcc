import { LightningElement, wire } from 'lwc';
import SAMPLEMC from '@salesforce/messageChannel/sampleMessage__c';
import { subscribe, unsubscribe, MessageContext, APPLICATION_SCOPE } from 'lightning/messageService';

export default class LmsComponentX extends LightningElement {

    recevedMessage
    @wire (MessageContext)
    context
    
    connectedCallback(){
        this.subscribeMessage()
    }

    subscribeMessage(){
        //subscribe(messageContext, messageChannel, listener, subscriberOptions)
        subscribe(
            this.context,
            SAMPLEMC,
            (message) => { this.handlerMessage(message) },
            {scope: APPLICATION_SCOPE}
        )
    }

    handlerMessage(message){
        this.recevedMessage = (message.lmsMessage.value ? message.lmsMessage.value  : 'NO message published')
    }
}