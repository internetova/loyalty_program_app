/// строковые данные приложения
class AppStrings {
  AppStrings._();

  static const appTitle = 'Программа лояльности';

  static const loyaltyName = 'Название ПЛ';
  static const loyaltyBonus = 'Активные бонусы';

  static const titleScreenCabinet = 'Кабинет';
  static const titleScreenProfile = 'Профиль';
  static const titleScreenAboutProgram = 'О программе';
  static const subtitleScreenAboutProgram = 'Описание уровней';

  /// поля форм
  static const inputEmail = 'E-mail:';
  static const inputPassword = 'Пароль:';
  static const inputConfirmPassword = 'Подтверждение пароля:';
  static const inputFirstName = 'Имя:';
  static const inputLastName = 'Фамилия:';
  static const inputPatronymic = 'Отчество:';
  static const inputBirthdate = 'Дата рождения:';
  static const inputCardNumber = 'Номер карты лояльности:';
  static const inputLevel = 'Описание уровня:';
  static const inputPhone = 'Телефон:';
  static const buttonEnter = 'Войти';
  static const buttonRegistration = 'Зарегистрироваться';
  static const buttonEdit = 'Изменить';

  /// валидация полей
  static const errorEmptyField = 'Пустое поле';
  static const errorIncorrectField = 'Некорректные данные';
  static const errorIsShotField = 'Мало символов';
  static const errorPasswordField = 'Не менее 8-ми символов';
  static const errorConfirmPasswordField = 'Пароли не совпадают';

  /// экран регистрации
  static const regContentHeader = 'Спасибо за регистрацию!';
  static const regContentText =
      'Теперь Вы можете зайти в систему и приступить к работе.';

  /// BottomNavigationBar
  static const bnbLabelCabinet = 'Кабинет';
  static const bnbLabelProfile = 'Профиль';

  /// SplashScreen
  static const splashTextHeader = 'Загрузка данных ...';
}
