# MovieQuiz
> Aplicativo para desenvolvimento Swift/iOS

* Linguagem
    * Swift 5.5
    * MVC
    
* Auto Layout
    * Autoresizing
    * Constraint
    * Assets
    * Outlet Collection
    
* Components
    * UIView
    * UILabel
    * UIImage
    * Segue
    * UIButton
    * UISlider
    * AVAudioPlayer
        * Tratando-se de audio a Apple recomenda a utilização desta classe devida a facilidade de uso e sua versatilidade a menos que queira tocar um audio vira streaming. Essa classe é indicado para audios locais.
    * Segue
    
## Recuperação de dados JSON
> A seguir um exemplo para recuperação de dados extraído de um arquivo JSON:
    
```swift
class QuizManager {

    let quizes      : [Quiz]
    let quizOptions : [QuizOption]
    var round       : Round?
    var score       : Int
    
    init() {
        score = 0
        // Recuperando a URL do arquivo no projeto - Arquivo: quizes.json
        let quizesURL = Bundle.main.url(forResource: "quizes", withExtension: "json")!
        do {
            // Criação da DATA a partir da URL
            let quizesData = try Data(contentsOf: quizesURL)
            // Decodificando o DATA em um array de Quiz
            quizes = try JSONDecoder().decode([Quiz].self, from: quizesData)
            // Recuperando a URL do arquivo no projeto
            let quizOptionURL = Bundle.main.url(forResource: "options", withExtension: "json")!
            // Criação do DATA a partir da URL
            let quizOptionsData = try! Data(contentsOf: quizOptionsURL)
            // Decodificando o Data em um array de QuizOptions
            quizOptions = try! JSONDecoder().decode([QuizOption].self, from: quizOptionsData)
        } catch {
            // Caso ocorra algum erro
            print(error.localizedDescription)
            quizes = []
            quizesOptions = []
        }
    }
}
```
    
## Snapshots


<img src="1.png" width="200">  
<br/>

<img src="2.png" width="200"> 
<br/> 

<img src="3.png" width="200">  
<br/>

<img src="4.png" width="200"> 
<br/> 


<img src="5.png" width="200">  
<br/>
