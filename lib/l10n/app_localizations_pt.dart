// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Pontos atuais';

  @override
  String goalLabel(int goal) {
    return 'Objetivo: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restantes: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Objetivo alcançado!';

  @override
  String get startButtonText => 'COMEÇAR';

  @override
  String get stressReductionMessage =>
      'Pratique prestar atenção ao que é positivo.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tempo restante: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tempo restante: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Pontuação: $score pontos';
  }

  @override
  String get imagePreparationMessage => 'A preparar as imagens...';

  @override
  String get noStimuliAvailable => 'Nenhum estímulo disponível';

  @override
  String get invalidGridSize => 'Tamanho de grelha inválido';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'A começar...';

  @override
  String get excellentPerformance => 'Desempenho excelente!';

  @override
  String get greatJob => 'Muito bem!';

  @override
  String get goodPerformance => 'Bom desempenho';

  @override
  String get keepPracticingFeedback => 'Continue a praticar';

  @override
  String get takeYourTimeFeedback => 'Não tenha pressa';

  @override
  String get happy => 'Feliz';

  @override
  String get angry => 'Zangado';

  @override
  String get fear => 'Medo';

  @override
  String get sad => 'Triste';

  @override
  String get historyPageTitle => 'Histórico de treino';

  @override
  String get dataLoading => 'A carregar dados...';

  @override
  String get pointsHistory => 'Histórico de pontos';

  @override
  String get weekly => 'Semanal';

  @override
  String get monthly => 'Mensal';

  @override
  String get noDataAvailable => 'Sem dados disponíveis';

  @override
  String get goalAchievementRate => 'Taxa de concretização do objetivo';

  @override
  String get scoreStatistics => 'Estatísticas de pontuação';

  @override
  String get bestScore => 'Melhor pontuação';

  @override
  String get totalScore => 'Pontuação total';

  @override
  String get trainingTime => 'Tempo de treino';

  @override
  String get totalTrainingTime => 'Tempo total de treino';

  @override
  String get detailedStatistics => 'Estatísticas detalhadas';

  @override
  String get averageScorePerMinute => 'Pontuação média por minuto';

  @override
  String get pointsToGoal => 'Pontos até ao objetivo';

  @override
  String get goalSetting => 'Definição do objetivo';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'pontos';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dom';

  @override
  String get mondayShort => 'Seg';

  @override
  String get tuesdayShort => 'Ter';

  @override
  String get wednesdayShort => 'Qua';

  @override
  String get thursdayShort => 'Qui';

  @override
  String get fridayShort => 'Sex';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get goalPointsSetting => 'Definição dos pontos objetivo';

  @override
  String currentGoalPoints(int points) {
    return 'Objetivo atual: $points pontos';
  }

  @override
  String get newGoalPointsLabel => 'Novos pontos objetivo';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'pontos';

  @override
  String get saveGoalButton => 'Guardar objetivo';

  @override
  String goalSetTo(int points) {
    return 'Objetivo definido em $points pontos';
  }

  @override
  String get enterGoalPoints => 'Introduza os pontos objetivo';

  @override
  String get enterValidNumber => 'Introduza um número válido (de 1 a 99999999)';

  @override
  String get saveFailed => 'Não foi possível guardar algumas definições';

  @override
  String get emailOpenFailed => 'Não foi possível abrir a aplicação de e-mail';

  @override
  String get pageOpenFailed => 'Não foi possível abrir a página';

  @override
  String get appInfoSupport => 'Informações da aplicação e suporte';

  @override
  String get contactUs => 'Contacte-nos';

  @override
  String get contactUsSubtitle => 'Partilhe os seus comentários e questões';

  @override
  String get termsOfService => 'Termos de serviço';

  @override
  String get termsSubtitle => 'Consulte os termos de serviço da aplicação';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get privacySubtitle => 'Sobre o tratamento das informações pessoais';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Saiba como utilizar a aplicação';

  @override
  String get dataManagement => 'Gestão de dados';

  @override
  String get deleteHistory => 'Eliminar histórico';

  @override
  String get deleteHistorySubtitle =>
      'Elimina apenas o histórico de treino (os pontos objetivo são mantidos)';

  @override
  String get deleteHistoryAndGoal => 'Eliminar histórico e objetivo';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Elimina todo o histórico e os pontos objetivo';

  @override
  String get deleteHistoryConfirmTitle => 'Eliminar histórico';

  @override
  String get deleteHistoryConfirmMessage =>
      'Tem a certeza de que pretende eliminar todo o histórico de treino?\n\n*Os pontos objetivo serão mantidos';

  @override
  String get deleteHistoryAndGoalConfirmTitle =>
      'Eliminar histórico e objetivo';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Tem a certeza de que pretende eliminar todo o histórico e os pontos objetivo?\n\n*Esta ação não pode ser anulada';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get historyDeleted => 'Histórico eliminado';

  @override
  String get historyAndGoalDeleted => 'Histórico e objetivo eliminados';

  @override
  String get historyDeleteFailed => 'Não foi possível eliminar o histórico';

  @override
  String get historyAndGoalDeleteFailed =>
      'Não foi possível eliminar o histórico e o objetivo';

  @override
  String get tutorialDisplayFailed => 'Não foi possível apresentar o tutorial';

  @override
  String get tips => 'Dicas';

  @override
  String get tipsContent =>
      '• O seu objetivo aparece no gráfico do ecrã inicial\n• Comece com um objetivo pequeno e aumente-o ao seu ritmo\n• Cada escolha certa vale até 6 pontos';

  @override
  String get backToHome => 'Voltar ao início';

  @override
  String get tutorialSkip => 'Ignorar';

  @override
  String get tutorialGoalAndPoints => 'Objetivo e pontos atuais';

  @override
  String get tutorialGoalDescription =>
      'O círculo exterior mostra o objetivo e o interior mostra o total de pontos. O círculo preenche-se à medida que se aproxima do objetivo.';

  @override
  String get tutorialOneMinuteTraining => 'Treino de 1 minuto';

  @override
  String get tutorialTrainingDescription =>
      'Inicie um jogo de 1 minuto. Escolha imagens positivas ou bons hábitos entre 4 opções.';

  @override
  String get tutorialScoreProgress => 'Evolução da pontuação';

  @override
  String get tutorialScoreDescription =>
      'Consulte informações detalhadas sobre as pontuações obtidas.';

  @override
  String get tutorialSettingsAndData => 'Definições e gestão de dados';

  @override
  String get tutorialSettingsDescription =>
      'Altere o objetivo, consulte as informações da aplicação e reponha os dados.';

  @override
  String get appIntroAttentionBiasTitle => 'Sobre o enviesamento atencional';

  @override
  String get appIntroAttentionBiasContent =>
      'Quando a ansiedade é elevada, tendemos inconscientemente a concentrar-nos apenas nas coisas negativas.';

  @override
  String get appIntroFocusMintRoleTitle => 'O papel do FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Um jogo breve para praticar como dirigir a atenção para imagens positivas.';

  @override
  String get appIntroScientificEvidenceTitle => 'Sobre este exercício';

  @override
  String get appIntroScientificEvidenceContent =>
      'Pratique encontrar imagens positivas. O FocusMint é uma ferramenta de autocuidado, não um tratamento médico. Os resultados variam de pessoa para pessoa.';

  @override
  String get appIntroExpectedEffectsTitle => 'O que pode praticar';

  @override
  String get appIntroEffect1 => 'Procurar imagens positivas';

  @override
  String get appIntroEffect2 => 'Reparar nos sorrisos à sua volta';

  @override
  String get appIntroEffect3 => 'Criar uma pequena rotina diária';

  @override
  String get appIntroHowToUse => 'Ver como utilizar';

  @override
  String get pointsEarned => 'Pontos ganhos!';

  @override
  String get yourScore => 'A sua pontuação';

  @override
  String get totalPlayTime => 'Tempo total de jogo';

  @override
  String get imageManagement => 'Gestão de imagens';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imagens ocultas: $count/$max';
  }

  @override
  String get unsavedChanges => 'Tem alterações por guardar';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Tem $count alterações por guardar nas definições de apresentação de imagens.';
  }

  @override
  String get unsavedChangesWarning =>
      'Se fechar este ecrã agora, as alterações serão perdidas.';

  @override
  String get discardChanges => 'Rejeitar alterações';

  @override
  String get saveAndExit => 'Guardar e sair';

  @override
  String settingsSaved(Object count) {
    return '$count definições guardadas';
  }

  @override
  String get saveError => 'Ocorreu um erro ao guardar as definições';

  @override
  String get imageSettingsUpdated =>
      'As definições de imagens foram atualizadas';

  @override
  String get allImages => 'Todas';

  @override
  String get positiveImages => 'Positivas';

  @override
  String get negativeImages => 'Negativas';

  @override
  String get smileImages => 'Sorrisos';

  @override
  String get vegetableImages => 'Alimentos nutritivos';

  @override
  String get healthImages => 'Movimento e convívio';

  @override
  String get sadImages => 'Raiva, tristeza e preocupação';

  @override
  String get badFoodImages => 'Comida rápida e doces';

  @override
  String get badImages => 'Hábitos pouco saudáveis';

  @override
  String get imageManagementHint =>
      'Toque para mostrar ou ocultar uma imagem. Pode ocultar até 15 imagens.';

  @override
  String get unsaved => 'Por guardar';

  @override
  String get save => 'Guardar';

  @override
  String get hiddenImages => 'Ocultas';

  @override
  String get noHiddenImages => 'Nenhuma imagem oculta';

  @override
  String get settingsLoadFailed => 'Não foi possível carregar as definições';

  @override
  String imagesAdded(int count) {
    return '$count imagens adicionadas';
  }

  @override
  String get imageAddFailed => 'Não foi possível adicionar as imagens';

  @override
  String get imageSelectionFailed => 'Não foi possível selecionar as imagens';

  @override
  String get settingsChangeFailed => 'Não foi possível alterar as definições';

  @override
  String groupTitle(String name) {
    return 'Grupo: $name';
  }

  @override
  String get displayToggle => 'Mostrar/ocultar';

  @override
  String imageCount(int count) {
    return '$count imagens';
  }

  @override
  String get noticeTitle => 'Notas importantes';

  @override
  String get notice1 =>
      'Foi adicionada a funcionalidade de imagens personalizadas!';

  @override
  String get notice2 =>
      'Pode adicionar as suas próprias imagens no ecrã de definições';

  @override
  String get notice3 => 'Consulte o ecrã de definições para mais detalhes';

  @override
  String get customImageTitle => 'Imagens personalizadas';

  @override
  String get customImageSubtitle =>
      'Adicione e faça a gestão das suas próprias imagens';

  @override
  String get addCustomImages => 'Adicionar imagens personalizadas';

  @override
  String get selectImages => 'Selecionar imagens';

  @override
  String get unknownImage => 'Imagem desconhecida';

  @override
  String get customImageSettings => 'Definições de imagens personalizadas';

  @override
  String get useCustomImages => 'Utilizar imagens personalizadas';

  @override
  String get useCustomImagesDescription =>
      'Use as suas imagens para praticar. Ative a mistura abaixo para incluir as imagens da aplicação.';

  @override
  String get groupSettings => 'Definições de grupos';

  @override
  String get minOneGroupRequired => 'Pelo menos um grupo tem de estar ativado';

  @override
  String get settingsLoadFailedMessage =>
      'Não foi possível carregar as definições';

  @override
  String get customImageNotice1 =>
      'Quando os grupos estão ativados, as imagens são apresentadas aleatoriamente para cada grupo.';

  @override
  String get customImageNotice2 =>
      'As imagens carregadas e definidas pelos utilizadores não são partilhadas com os programadores nem com terceiros e são guardadas apenas na área da aplicação no dispositivo.';

  @override
  String get customImageNotice3 => 'Isto permite a utilização offline.';

  @override
  String get customImageNotice4 =>
      'Adicionar muitas imagens ocupa espaço de armazenamento. Se tiver problemas, desative as imagens pessoais ou elimine as que não usa nas definições.';

  @override
  String get customImageNotice5 =>
      'Quando elimina a aplicação, as imagens definidas são eliminadas.';

  @override
  String get customImageRequirementNotMet =>
      'Para utilizar imagens personalizadas, precisa de pelo menos 1 imagem boa e 3 imagens não boas nos grupos ativados.';

  @override
  String get customImageRequirement =>
      'Para utilizar imagens personalizadas, precisa de pelo menos 1 imagem boa e 3 imagens não boas nos grupos ativados.';

  @override
  String get sunnyWeather => 'Boas';

  @override
  String get rainyWeather => 'Não boas';

  @override
  String get addImages => 'Adicionar imagens';

  @override
  String get imageDeleted => 'Imagem eliminada';

  @override
  String get imageDeleteFailed => 'Não foi possível eliminar a imagem';

  @override
  String get deleteImageTitle => 'Eliminar imagem';

  @override
  String get deleteImageMessage =>
      'Pretende eliminar esta imagem? Esta ação não pode ser anulada.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imagens $weather do grupo $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Registadas: $count imagens';
  }

  @override
  String get noImagesRegistered => 'Nenhuma imagem registada';

  @override
  String get imagePreview => 'Pré-visualização da imagem';

  @override
  String get close => 'Fechar';

  @override
  String get contactEmailSubject => 'FocusMint - Contacto';

  @override
  String get contactEmailBody => 'Partilhe os seus comentários e questões.';

  @override
  String get mixWithBuiltInImages => 'Misturar com imagens da aplicação';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Usar as suas imagens e as imagens da aplicação em conjunto';

  @override
  String get supportIntro =>
      'Converse anonimamente com o programador. Pode enviar perguntas e sugestões. Tem 3 mensagens por dia. Cada resposta do programador repõe o seu limite em 3.';

  @override
  String get supportReceived =>
      'Mensagem recebida. Normalmente respondemos em 2–3 dias.';

  @override
  String get supportComposer => 'Escreva uma mensagem';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportRetry => 'Tentar novamente';

  @override
  String get supportSent => 'Enviada';

  @override
  String get supportUnsent => 'Não enviada · guardada neste dispositivo';

  @override
  String get supportAttach => 'Anexar imagem';

  @override
  String get supportRemoveImage => 'Remover imagem';

  @override
  String get supportImage => 'Anexo';

  @override
  String get supportClear => 'Eliminar histórico';

  @override
  String get supportClearConfirm =>
      'Eliminar esta conversa? Os rascunhos não enviados e o histórico no servidor também serão eliminados. Isto não repõe o seu limite.';

  @override
  String get supportQuota =>
      'Já usou as 3 mensagens de hoje. Envie outra amanhã ou após uma resposta do programador.';

  @override
  String get supportConnectionError =>
      'Não foi possível estabelecer ligação. Os rascunhos guardados não foram enviados.';

  @override
  String get supportSendError =>
      'Não foi possível enviar. A mensagem está guardada neste dispositivo. Tente novamente.';

  @override
  String get supportStorageError =>
      'Não foi possível guardar. Tente novamente.';

  @override
  String get supportClearError =>
      'Não foi possível eliminar o histórico. Verifique a ligação e tente novamente.';

  @override
  String get supportImageError =>
      'Não foi possível carregar a imagem. Escolha uma imagem com menos de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Mensagens disponíveis hoje: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Respostas por ler: $count';
  }

  @override
  String get supportGuide => 'Informações';

  @override
  String get supportDeveloper => 'Programador';

  @override
  String get supportPrivacy => 'Dados dos pedidos de apoio';

  @override
  String get breathingTitle => 'Faça uma pausa para respirar';

  @override
  String get breathingHint =>
      'Siga o movimento suave dos pulmões\na um ritmo confortável.';

  @override
  String get breathingIn => 'Inspire devagar';

  @override
  String get breathingOut => 'Expire devagar';

  @override
  String get breathingProgress => 'Progresso da respiração';

  @override
  String get breathingResultHint =>
      'Os seus resultados aparecem automaticamente.';

  @override
  String get breathingSkip => 'Ir para os resultados';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get focusMintTitle => 'FOCUS MINT';

  @override
  String get currentPoints => 'Pontos atuais';

  @override
  String goalLabel(int goal) {
    return 'Meta: $goal';
  }

  @override
  String remainingLabel(int remaining) {
    return 'Restantes: $remaining';
  }

  @override
  String get goalAchieved => '🎉 Meta alcançada!';

  @override
  String get startButtonText => 'COMEÇAR';

  @override
  String get stressReductionMessage => 'Pratique perceber o que é positivo.';

  @override
  String remainingTimeMinutes(int minutes, int seconds) {
    return 'Tempo restante: ${minutes}m ${seconds}s';
  }

  @override
  String remainingTimeSeconds(int seconds) {
    return 'Tempo restante: ${seconds}s';
  }

  @override
  String scoreLabel(String score) {
    return 'Pontuação: $score pontos';
  }

  @override
  String get imagePreparationMessage => 'Preparando imagens...';

  @override
  String get noStimuliAvailable => 'Nenhum estímulo disponível';

  @override
  String get invalidGridSize => 'Tamanho de grade inválido';

  @override
  String get unknown => '?';

  @override
  String get gettingStarted => 'Começando...';

  @override
  String get excellentPerformance => 'Desempenho excelente!';

  @override
  String get greatJob => 'Muito bem!';

  @override
  String get goodPerformance => 'Bom desempenho';

  @override
  String get keepPracticingFeedback => 'Continue praticando';

  @override
  String get takeYourTimeFeedback => 'Vá com calma';

  @override
  String get happy => 'Feliz';

  @override
  String get angry => 'Irritado';

  @override
  String get fear => 'Medo';

  @override
  String get sad => 'Triste';

  @override
  String get historyPageTitle => 'Histórico de treinamento';

  @override
  String get dataLoading => 'Carregando dados...';

  @override
  String get pointsHistory => 'Histórico de pontos';

  @override
  String get weekly => 'Semanal';

  @override
  String get monthly => 'Mensal';

  @override
  String get noDataAvailable => 'Nenhum dado disponível';

  @override
  String get goalAchievementRate => 'Taxa de conclusão da meta';

  @override
  String get scoreStatistics => 'Estatísticas de pontuação';

  @override
  String get bestScore => 'Melhor pontuação';

  @override
  String get totalScore => 'Pontuação total';

  @override
  String get trainingTime => 'Tempo de treinamento';

  @override
  String get totalTrainingTime => 'Tempo total de treinamento';

  @override
  String get detailedStatistics => 'Estatísticas detalhadas';

  @override
  String get averageScorePerMinute => 'Pontuação média por minuto';

  @override
  String get pointsToGoal => 'Pontos até a meta';

  @override
  String get goalSetting => 'Configuração da meta';

  @override
  String get secondsUnit => 's';

  @override
  String get minutesUnit => 'min';

  @override
  String get hoursUnit => 'h';

  @override
  String get pointsUnit => 'pontos';

  @override
  String get monthSuffix => '';

  @override
  String get sundayShort => 'Dom';

  @override
  String get mondayShort => 'Seg';

  @override
  String get tuesdayShort => 'Ter';

  @override
  String get wednesdayShort => 'Qua';

  @override
  String get thursdayShort => 'Qui';

  @override
  String get fridayShort => 'Sex';

  @override
  String get saturdayShort => 'Sáb';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get goalPointsSetting => 'Configuração de pontos da meta';

  @override
  String currentGoalPoints(int points) {
    return 'Meta atual: $points pontos';
  }

  @override
  String get newGoalPointsLabel => 'Novos pontos da meta';

  @override
  String get goalPointsHint => '1000';

  @override
  String get pointsUnit2 => 'pontos';

  @override
  String get saveGoalButton => 'Salvar meta';

  @override
  String goalSetTo(int points) {
    return 'Meta definida em $points pontos';
  }

  @override
  String get enterGoalPoints => 'Insira os pontos da meta';

  @override
  String get enterValidNumber => 'Insira um número válido (de 1 a 99999999)';

  @override
  String get saveFailed => 'Falha ao salvar algumas configurações';

  @override
  String get emailOpenFailed => 'Não foi possível abrir o aplicativo de e-mail';

  @override
  String get pageOpenFailed => 'Não foi possível abrir a página';

  @override
  String get appInfoSupport => 'Informações do aplicativo e suporte';

  @override
  String get contactUs => 'Fale conosco';

  @override
  String get contactUsSubtitle => 'Compartilhe seus comentários e dúvidas';

  @override
  String get termsOfService => 'Termos de serviço';

  @override
  String get termsSubtitle => 'Veja os termos de serviço do aplicativo';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get privacySubtitle => 'Sobre o tratamento das informações pessoais';

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get tutorialSubtitle => 'Aprenda a usar o aplicativo';

  @override
  String get dataManagement => 'Gerenciamento de dados';

  @override
  String get deleteHistory => 'Excluir histórico';

  @override
  String get deleteHistorySubtitle =>
      'Exclui apenas o histórico de treinamento (os pontos da meta são mantidos)';

  @override
  String get deleteHistoryAndGoal => 'Excluir histórico e meta';

  @override
  String get deleteHistoryAndGoalSubtitle =>
      'Exclui todo o histórico e os pontos da meta';

  @override
  String get deleteHistoryConfirmTitle => 'Excluir histórico';

  @override
  String get deleteHistoryConfirmMessage =>
      'Tem certeza de que deseja excluir todo o histórico de treinamento?\n\n*Os pontos da meta serão mantidos';

  @override
  String get deleteHistoryAndGoalConfirmTitle => 'Excluir histórico e meta';

  @override
  String get deleteHistoryAndGoalConfirmMessage =>
      'Tem certeza de que deseja excluir todo o histórico e os pontos da meta?\n\n*Esta ação não pode ser desfeita';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get historyDeleted => 'Histórico excluído';

  @override
  String get historyAndGoalDeleted => 'Histórico e meta excluídos';

  @override
  String get historyDeleteFailed => 'Falha ao excluir o histórico';

  @override
  String get historyAndGoalDeleteFailed =>
      'Falha ao excluir o histórico e a meta';

  @override
  String get tutorialDisplayFailed => 'Falha ao exibir o tutorial';

  @override
  String get tips => 'Dicas';

  @override
  String get tipsContent =>
      '• Sua meta aparece no gráfico da tela inicial\n• Comece com uma meta pequena e aumente no seu ritmo\n• Cada escolha correta vale até 6 pontos';

  @override
  String get backToHome => 'Voltar para o início';

  @override
  String get tutorialSkip => 'Pular';

  @override
  String get tutorialGoalAndPoints => 'Meta e pontos atuais';

  @override
  String get tutorialGoalDescription =>
      'O círculo externo mostra a meta e o interno mostra o total de pontos. O círculo vai se preenchendo conforme você se aproxima da meta.';

  @override
  String get tutorialOneMinuteTraining => 'Treinamento de 1 minuto';

  @override
  String get tutorialTrainingDescription =>
      'Inicie um jogo de 1 minuto. Escolha imagens positivas ou bons hábitos entre 4 opções.';

  @override
  String get tutorialScoreProgress => 'Progresso da pontuação';

  @override
  String get tutorialScoreDescription =>
      'Veja informações detalhadas sobre as pontuações obtidas.';

  @override
  String get tutorialSettingsAndData =>
      'Configurações e gerenciamento de dados';

  @override
  String get tutorialSettingsDescription =>
      'Altere a meta, veja as informações do aplicativo e redefina os dados.';

  @override
  String get appIntroAttentionBiasTitle => 'Sobre o viés de atenção';

  @override
  String get appIntroAttentionBiasContent =>
      'Quando a ansiedade está alta, tendemos inconscientemente a nos concentrar apenas nas coisas negativas.';

  @override
  String get appIntroFocusMintRoleTitle => 'O papel do FocusMint';

  @override
  String get appIntroFocusMintRoleContent =>
      'Um jogo breve para praticar como direcionar a atenção para imagens positivas.';

  @override
  String get appIntroScientificEvidenceTitle => 'Sobre este exercício';

  @override
  String get appIntroScientificEvidenceContent =>
      'Pratique encontrar imagens positivas. O FocusMint é uma ferramenta de autocuidado, não um tratamento médico. Os resultados variam de pessoa para pessoa.';

  @override
  String get appIntroExpectedEffectsTitle => 'O que você pode praticar';

  @override
  String get appIntroEffect1 => 'Procurar imagens positivas';

  @override
  String get appIntroEffect2 => 'Perceber os sorrisos ao seu redor';

  @override
  String get appIntroEffect3 => 'Criar uma pequena rotina diária';

  @override
  String get appIntroHowToUse => 'Ver como usar';

  @override
  String get pointsEarned => 'Pontos ganhos!';

  @override
  String get yourScore => 'Sua pontuação';

  @override
  String get totalPlayTime => 'Tempo total de jogo';

  @override
  String get imageManagement => 'Gerenciamento de imagens';

  @override
  String hiddenImagesCount(int count, int max) {
    return 'Imagens ocultas: $count/$max';
  }

  @override
  String get unsavedChanges => 'Você tem alterações não salvas';

  @override
  String unsavedChangesMessage(Object count) {
    return 'Você tem $count alterações não salvas nas configurações de exibição de imagens.';
  }

  @override
  String get unsavedChangesWarning =>
      'Se você fechar esta tela agora, as alterações serão perdidas.';

  @override
  String get discardChanges => 'Descartar alterações';

  @override
  String get saveAndExit => 'Salvar e sair';

  @override
  String settingsSaved(Object count) {
    return '$count configurações salvas';
  }

  @override
  String get saveError => 'Ocorreu um erro ao salvar as configurações';

  @override
  String get imageSettingsUpdated =>
      'As configurações de imagens foram atualizadas';

  @override
  String get allImages => 'Todas';

  @override
  String get positiveImages => 'Positivas';

  @override
  String get negativeImages => 'Negativas';

  @override
  String get smileImages => 'Sorrisos';

  @override
  String get vegetableImages => 'Alimentos nutritivos';

  @override
  String get healthImages => 'Movimento e convivência';

  @override
  String get sadImages => 'Raiva, tristeza e preocupação';

  @override
  String get badFoodImages => 'Fast-food e doces';

  @override
  String get badImages => 'Hábitos pouco saudáveis';

  @override
  String get imageManagementHint =>
      'Toque para mostrar ou ocultar uma imagem. Você pode ocultar até 15 imagens.';

  @override
  String get unsaved => 'Não salvo';

  @override
  String get save => 'Salvar';

  @override
  String get hiddenImages => 'Ocultas';

  @override
  String get noHiddenImages => 'Nenhuma imagem oculta';

  @override
  String get settingsLoadFailed => 'Falha ao carregar as configurações';

  @override
  String imagesAdded(int count) {
    return '$count imagens adicionadas';
  }

  @override
  String get imageAddFailed => 'Falha ao adicionar imagens';

  @override
  String get imageSelectionFailed => 'Falha ao selecionar imagens';

  @override
  String get settingsChangeFailed => 'Falha ao alterar as configurações';

  @override
  String groupTitle(String name) {
    return 'Grupo: $name';
  }

  @override
  String get displayToggle => 'Mostrar/ocultar';

  @override
  String imageCount(int count) {
    return '$count imagens';
  }

  @override
  String get noticeTitle => 'Avisos importantes';

  @override
  String get notice1 => 'O recurso de imagens personalizadas foi adicionado!';

  @override
  String get notice2 =>
      'Você pode adicionar suas próprias imagens na tela de configurações';

  @override
  String get notice3 => 'Confira a tela de configurações para mais detalhes';

  @override
  String get customImageTitle => 'Imagens personalizadas';

  @override
  String get customImageSubtitle => 'Adicione e gerencie suas próprias imagens';

  @override
  String get addCustomImages => 'Adicionar imagens personalizadas';

  @override
  String get selectImages => 'Selecionar imagens';

  @override
  String get unknownImage => 'Imagem desconhecida';

  @override
  String get customImageSettings => 'Configurações de imagens personalizadas';

  @override
  String get useCustomImages => 'Usar imagens personalizadas';

  @override
  String get useCustomImagesDescription =>
      'Use suas próprias imagens para praticar. Ative a mistura abaixo para incluir as imagens do aplicativo.';

  @override
  String get groupSettings => 'Configurações de grupos';

  @override
  String get minOneGroupRequired => 'Pelo menos um grupo deve estar ativado';

  @override
  String get settingsLoadFailedMessage => 'Falha ao carregar as configurações';

  @override
  String get customImageNotice1 =>
      'Quando os grupos estão ativados, as imagens são exibidas aleatoriamente para cada grupo.';

  @override
  String get customImageNotice2 =>
      'As imagens enviadas e definidas pelos usuários não são compartilhadas com os desenvolvedores nem com terceiros e são armazenadas apenas na área do aplicativo no dispositivo.';

  @override
  String get customImageNotice3 => 'Isso permite o uso offline.';

  @override
  String get customImageNotice4 =>
      'Adicionar muitas imagens ocupa espaço de armazenamento. Se tiver problemas, desative as imagens pessoais ou remova as que não usa nas configurações.';

  @override
  String get customImageNotice5 =>
      'Quando você exclui o aplicativo, as imagens definidas são excluídas.';

  @override
  String get customImageRequirementNotMet =>
      'Para usar imagens personalizadas, você precisa de pelo menos 1 imagem boa e 3 imagens não boas nos grupos ativados.';

  @override
  String get customImageRequirement =>
      'Para usar imagens personalizadas, você precisa de pelo menos 1 imagem boa e 3 imagens não boas nos grupos ativados.';

  @override
  String get sunnyWeather => 'Boas';

  @override
  String get rainyWeather => 'Não boas';

  @override
  String get addImages => 'Adicionar imagens';

  @override
  String get imageDeleted => 'Imagem excluída';

  @override
  String get imageDeleteFailed => 'Falha ao excluir a imagem';

  @override
  String get deleteImageTitle => 'Excluir imagem';

  @override
  String get deleteImageMessage =>
      'Deseja excluir esta imagem? Esta ação não pode ser desfeita.';

  @override
  String groupImageTitle(int groupId, String weather) {
    return 'Imagens $weather do grupo $groupId';
  }

  @override
  String registeredCount(int count) {
    return 'Cadastradas: $count imagens';
  }

  @override
  String get noImagesRegistered => 'Nenhuma imagem cadastrada';

  @override
  String get imagePreview => 'Prévia da imagem';

  @override
  String get close => 'Fechar';

  @override
  String get contactEmailSubject => 'FocusMint - Contato';

  @override
  String get contactEmailBody => 'Escreva seus comentários e dúvidas.';

  @override
  String get mixWithBuiltInImages => 'Misturar com imagens do aplicativo';

  @override
  String get mixWithBuiltInImagesDescription =>
      'Usar suas imagens e as imagens do aplicativo juntas';

  @override
  String get supportIntro =>
      'Converse anonimamente com o desenvolvedor. Perguntas e sugestões são bem-vindas. Você pode enviar 3 mensagens por dia. Cada resposta do desenvolvedor restaura seu limite para 3.';

  @override
  String get supportReceived =>
      'Mensagem recebida. Normalmente respondemos em 2–3 dias.';

  @override
  String get supportComposer => 'Digite uma mensagem';

  @override
  String get supportSend => 'Enviar';

  @override
  String get supportRetry => 'Tentar novamente';

  @override
  String get supportSent => 'Enviada';

  @override
  String get supportUnsent => 'Não enviada · salva neste dispositivo';

  @override
  String get supportAttach => 'Anexar imagem';

  @override
  String get supportRemoveImage => 'Remover imagem';

  @override
  String get supportImage => 'Anexo';

  @override
  String get supportClear => 'Excluir histórico';

  @override
  String get supportClearConfirm =>
      'Excluir esta conversa? Os rascunhos não enviados e o histórico no servidor também serão excluídos. Isso não restaura seu limite.';

  @override
  String get supportQuota =>
      'Você usou as 3 mensagens de hoje. Envie outra amanhã ou após uma resposta do desenvolvedor.';

  @override
  String get supportConnectionError =>
      'Não foi possível conectar. Os rascunhos salvos não foram enviados.';

  @override
  String get supportSendError =>
      'Não foi possível enviar. Sua mensagem está salva neste dispositivo. Tente novamente.';

  @override
  String get supportStorageError => 'Não foi possível salvar. Tente novamente.';

  @override
  String get supportClearError =>
      'Não foi possível excluir o histórico. Confira sua conexão e tente novamente.';

  @override
  String get supportImageError =>
      'Não foi possível carregar a imagem. Escolha uma imagem com menos de 30 MB.';

  @override
  String supportRemaining(int count) {
    return 'Mensagens disponíveis hoje: $count';
  }

  @override
  String supportUnread(int count) {
    return 'Respostas não lidas: $count';
  }

  @override
  String get supportGuide => 'Informações';

  @override
  String get supportDeveloper => 'Desenvolvedor';

  @override
  String get supportPrivacy => 'Dados de suporte';

  @override
  String get breathingTitle => 'Faça uma pausa para respirar';

  @override
  String get breathingHint =>
      'Acompanhe o movimento suave dos pulmões\nem um ritmo confortável.';

  @override
  String get breathingIn => 'Inspire devagar';

  @override
  String get breathingOut => 'Expire devagar';

  @override
  String get breathingProgress => 'Progresso da respiração';

  @override
  String get breathingResultHint =>
      'Seus resultados aparecerão automaticamente.';

  @override
  String get breathingSkip => 'Ir para os resultados';
}
