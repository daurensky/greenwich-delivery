<?php
session_start();
require_once 'classes/Db.class.php';

$errors = [];

if (isset($_POST['login'])) {
    $user = Db::app()->select('users', ['*'], [
        'email' => $_POST['email']
    ]);

    if (!$user) {
        $errors['email'] = 'Пользователь не найден';
    }

    if (!password_verify($_POST['password'], $user['password'])) {
        $errors['password'] = 'Неверный пароль';
    }

    if (empty($errors)) {
        $_SESSION['user'] = [
            'id' => $user['id'],
            'email' => $user['email'],
            'name' => $user['name']
        ];

        header('Location: /');
    }
}

if (isset($_POST['register'])) {
    $user = Db::app()->select('users', ['email'], [
        'email' => $_POST['email']
    ]);

    if ($user) {
        $errors['email'] = 'Пользователь с данным электронным адресом уже существует';
    }

    if (mb_strlen($_POST['email'], 'utf-8') > 255) {
        $errors['email'] = 'Максимальная длинна электронного адреса - 255 символов';
    }

    if (mb_strlen($_POST['name'], 'utf-8') > 30) {
        $errors['name'] = 'Максимальная длинна имени - 30 символов';
    }

    if (mb_strlen($_POST['password'], 'utf-8') > 60 || mb_strlen($_POST['password'], 'utf-8') < 5) {
        $errors['password'] = 'Минимальная длинна пароля - 5. Максимальная - 60 символов';
    }

    if ($_POST['password'] !== $_POST['passwordConfirm']) {
        $errors['passwordConfirm'] = 'Пароли не совпадают';
    }

    if (empty($errors)) {
        $db = new Db();
        $db->insert('users', [
            'email' => $_POST['email'],
            'name' => $_POST['name'],
            'password' => password_hash($_POST['password'], PASSWORD_DEFAULT),
        ]);

        $_SESSION['user'] = [
            'id' => $db->select('users', ['id'], ['email' => $_POST['email']])['id'],
            'email' => $_POST['email'],
            'name' => $_POST['name']
        ];

        header('Location: /');
    }
}

function error($name)
{
    global $errors;
    return isset($errors[$name]) ? $errors[$name] : '';
}

function value($name)
{
    return isset($_POST[$name]) ? $_POST[$name] : '';
}

require_once 'components/header.php';
?>

<main>
    <div class="container">
        <section class="auth">
            <?php if (isset($_GET['register'])) { ?>
                <h1>Регистрация</h1>
                <form method="POST">
                    <div class="form-group">
                        <label for="email">Электронная почта</label>
                        <input type="email" name="email" required placeholder="example@greenwich.kz" value="<?= value('email') ?>" maxlength="255" />
                        <p class="error"><?= error('email') ?></p>
                    </div>
                    <div class="form-group">
                        <label for="name">Имя</label>
                        <input type="text" name="name" required placeholder="Диас" value="<?= value('name') ?>" maxlength="30" />
                        <p class="error"><?= error('name') ?></p>
                    </div>
                    <div class="form-group">
                        <label for="password">Пароль</label>
                        <input type="password" name="password" required value="<?= value('password') ?>" maxlength="60" />
                        <p class="error"><?= error('password') ?></p>
                    </div>
                    <div class="form-group">
                        <label for="passwordConfirm">Подтверждение пароля</label>
                        <input type="password" name="passwordConfirm" required value="<?= value('passwordConfirm') ?>" />
                        <p class="error"><?= error('passwordConfirm') ?></p>
                    </div>
                    <div class="form-group">
                        <button class="btn" type="submit" name="register">
                            Зарегистрироваться
                        </button>
                    </div>
                    <div class="form-group">
                        <p>Есть аккаунт? <a href="auth.php">Войти</a></p>
                    </div>
                </form>
            <?php } else { ?>
                <h1>Вход</h1>
                <form method="POST">
                    <div class="form-group">
                        <label for="email">Электронная почта</label>
                        <input type="email" name="email" required value="<?= value('email') ?>" maxlength="255" />
                        <p class="error"><?= error('email') ?></p>
                    </div>
                    <div class="form-group">
                        <label for="password">Пароль</label>
                        <input type="password" name="password" required value="<?= value('password') ?>" maxlength="60" />
                        <p class="error"><?= error('password') ?></p>
                    </div>
                    <div class="form-group">
                        <button class="btn" type="submit" name="login">Войти</button>
                    </div>
                    <div class="form-group">
                        <p>
                            Нет аккаунта? <a href="auth.php?register">Зарегистрироваться</a>
                        </p>
                    </div>
                </form>
            <?php } ?>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>