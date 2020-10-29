import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome to PWORD',
          'welcome_sub': 'your password manager & generator',
          'generator': 'Generator',
          'safe': 'Safe',
          'settings': 'Settings',
          'uppercase': 'Uppercase letters',
          'lowercase': 'Lowercase letters',
          'symbols': 'Symbols',
          'numbers': 'Numbers',
          'noun': 'Use noun',
          'invalid_submit':
              'You need to select at least one option besides use nouns!',
          'pass_copied':
              'Password copied to clipboard! Thank you for using pword.',
          'store_password': 'Store your password',
          'generate_password': 'Generate new password',
          'pass_length': 'Password Length:',
          'generate': 'Generate',
          'strength': 'Strength',
          'strong': 'strong',
          'average': 'average',
          'weak': 'weak',
          'increase_score':
              'To increase the score, select more\noptions at the generation menu.',
          'copy': 'Copy',
          'save': 'Save',
          'confirm_delete': "This password was deleted!",
          "pass_safe": "Password Safe",
          'description': 'description',
          'password': 'password',
          'confirm': 'Confirm',
          'ask_delete': 'Are you sure you want to delete this password?',
          'input_description': 'Description',
          'back': 'Go back',
        },
        'pt_BR': {
          'welcome': 'Bem vindo ao PWORD',
          'welcome_sub': 'seu gerador e cofre de senhas',
          'generator': 'Gerador',
          'safe': 'Cofre',
          'settings': 'Ajustes',
          'uppercase': 'Usar maiúsculas',
          'lowercase': 'Usar minúsculas',
          'symbols': 'Símbolos',
          'numbers': 'Números',
          'noun': 'Substantivo',
          'invalid_submit':
              'Você precisa selecionar mais uma opção além de usar substantivos!',
          'pass_copied':
              'Senha copiada para a área de transferência. Obrigado por usar o PWORD',
          'store_password': 'Armazene a senha',
          'generate_password': 'Gerar uma nova senha',
          'pass_length': 'Tamanho da senha:',
          'generate': 'Gerar',
          'strength': 'Força',
          'strong': 'forte',
          'average': 'mediana',
          'weak': 'fraca',
          'increase_score':
              'Para aumentar a força, seleciona\nmais ou outras opções no menu gerar.',
          'copy': 'Copiar',
          'save': 'Salvar',
          'confirm_delete': "A senha foi deletada!",
          "pass_safe": "Cofre de senhas",
          'description': 'descrição',
          'password': 'senha',
          'confirm': 'Confirmar',
          'ask_delete': 'Tem certeza que quer deletar essa senha?',
          'input_description': 'Insira uma descrição',
          'back': 'Voltar'
        }
      };
}
