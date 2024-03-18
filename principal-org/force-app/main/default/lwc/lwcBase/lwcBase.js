import { LightningElement } from 'lwc';

export default class LwcBase extends LightningElement {

    animaisLista = [
        {
            tipo: "ave",
            exemplos: ['curió','sabiá','calopsita','culeiro','azulão','cambaxirra'],
            id:1
        },
        {
            tipo: "peixe",
            exemplos: ['bonito','curvina','dourado','salmão','tucunaré'],
            id:2
        },
        {
            tipo: "felino",
           exemplos: ['gato','leão','puma','onça','tigre','pantera'],
            id:3
        }
    ]
    nomes = ["Ana Carolina","Bianca Meneses","Jorge Rodrigues","Felipe Eduardo"]
    nomeCompleto = "Salesforce Brasil"

    attrChangeHandler(event){
        this.nomeCompleto = event.target.value;
    }

    desenvolvedor = {
        nome:"Michelle LC",
        cargo:"Analista de sistemas",
        idade:28
    }
    
    /*objChangeHandler(event){ //@track desenvolvedor para acessar os atributos internos de um objeto por exemplo
        this.desenvolvedor.nome = event.target.value;
    } ou Spread Operator*/

    objChangeHandler(event){
        this.desenvolvedor = {...this.desenvolvedor, "nome":event.target.value}
    }
}