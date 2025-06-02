import 'package:project/data/modal/terms.dart';

class AppTextConst {
  AppTextConst._();

  // Sign-In
  static const String signInTitle1 = "Inciar Sessão";
  static const String signInSubTitle1 =
      "Seja bem vindo, insira seus dados para inciar sessão";
  static const String signInForgetPassword = "Esqueceu sua senha?";
  static const String signInDontHaveAccount = "Não têm conta? ";
  static const String signInCreate = "Crie";

  // Sign-Up
  static const String signUpTitle1 = "Criar Conta";
  static const String signUpSubTitle1 =
      "Seja bem vindo, preencha os campos para criar a sua conta";

  //  forget Password
  static const String forgetPTitle1 = "Recuperar senha";
  static const String forgetPSubTitle1 =
      "Insira seu email, para poder receber o codigo de recuperação de senha";

  // Otp verify
  static const String otpTitle1 = "Verificar Codigo";
  static const String otpSubTitle1 = "Insira o codigo enviado no seu email";
  static const String otpDidntreceive = "Nao recebeu codigo? ";
  static const String otpResend = "Reenviar";

  // New Password
  static const String newPasswordTitle = "Nova Senha";
  static const String newPasswordSubTitle1 = "Insira a nova senha";
  static const String newPasswordSubTitle2 =
      "*E no minimo deve ter 8 caracteres";

  // Terms and condition
  static const String termsTitle = "Termos e Condições";
  static List<Terms> listOfTerms = [
    Terms(
      title: "Finalidade do Empréstimo",
      descrition:
          "O empréstimo de equipamentos destina-se exclusivamente ao uso temporário, conforme acordado no momento da reserva ou retirada.",
    ),
    Terms(
      title: "Identificação Obrigatória",
      descrition:
          "Para levantamento dos equipamentos, o utilizador deverá apresentar e deixar uma cópia válida do Bilhete de Identidade (BI) ou documento equivalente como garantia.",
    ),
    Terms(
      title: "Prazos de Devolução",
      descrition:
          "O prazo de devolução será definido no ato do empréstimo. O não cumprimento deste prazo implicará em penalizações.",
    ),
    Terms(
      title: "Penalizações por Atraso",
      descrition:
          "Em caso de atraso na devolução, será aplicada uma penalização de 40,00 MT por dia de atraso, calculado a partir da data prevista de devolução.",
    ),
    Terms(
      title: "Danos aos Equipamentos",
      descrition:
          "Caso o equipamento seja devolvido com danos, o utilizador será responsabilizado pelos custos de reparação ou substituição, conforme avaliação da equipe da ferragem.",
    ),
    Terms(
      title: "Responsabilidade do Utilizador",
      descrition:
          "O utilizador é inteiramente responsável pelo equipamento durante o período de empréstimo, devendo utilizá-lo de forma adequada e segura.",
    ),
    Terms(
      title: "Devolução Antecipada ou Cancelamento",
      descrition:
          "A devolução antecipada ou cancelamento do empréstimo não isenta o utilizador de responsabilidades por eventuais danos ou uso indevido do equipamento.",
    ),
  ];

  static const String acceptTerms = "Aceito todos os termos";

  // Home

  static const String bannerText =
      '"Encontre o equipamento certo, quando você precisar!"';
  static const String homeCategorieTitle = "Categorias";
  static const String homeEquipamentTitle = "Todos Equipamentos";
}
