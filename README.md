# nasa_apod
Listagem e de detalhes das fotos publicadas pela Nasa (Nasa Astronomy Picture of the Day)

## Dependências
- Mobx
- GetIt
- Mockito (para os testes unitários)
- http_mock_adapter (para os testes unitários)

## Gerar código .g das Stores do Mobx e Mockito

`flutter pub run build_runner watch --delete-conflicting-outputs`
(Com o comando watch vai continuar gerando sempre que alguma store for modificada. Se quiser rodar somente uma vez, troque por build)

## Testes unitários
Para executar os testes unitários, utilize o comando `flutter test`