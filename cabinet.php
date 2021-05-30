<?php
session_start();
require_once 'classes/Db.class.php';

$user = $_SESSION['user'];
$errors = [];

if (isset($_POST['change'])) {
    if (mb_strlen($_POST['email'], 'utf-8') > 255) {
        $errors['email'] = 'Максимальная длинна электронного адреса - 255 символов';
    }

    if (mb_strlen($_POST['name'], 'utf-8') > 30) {
        $errors['name'] = 'Максимальная длинна имени - 30 символов';
    }

    if ($_POST['password']) {
        if (mb_strlen($_POST['password'], 'utf-8') > 60 || mb_strlen($_POST['password'], 'utf-8') < 5) {
            $errors['password'] = 'Минимальная длинна пароля - 5. Максимальная - 60 символов';
        }

        if ($_POST['password'] !== $_POST['passwordConfirm']) {
            $errors['passwordConfirm'] = 'Пароли не совпадают';
        }
    }

    if (empty($errors)) {
        $db = new Db();
        if ($_POST['password']) {
            $db->update('users', [
                'email' => $_POST['email'],
                'name' => $_POST['name'],
                'password' => password_hash($_POST['password'], PASSWORD_DEFAULT),
            ], ['email' => $_POST['email']]);
        } else {
            $db->update('users', [
                'email' => $_POST['email'],
                'name' => $_POST['name'],
            ], ['email' => $_POST['email']]);
        }

        $_SESSION['user'] = [
            'id' => $db->select('users', ['id'], ['email' => $_POST['email']])['id'],
            'email' => $_POST['email'],
            'name' => $_POST['name'],
        ];

        header('Location: /cabinet.php?edited');
    }
}

function error($name)
{
    global $errors;
    return isset($errors[$name]) ? $errors[$name] : '';
}

function value($name)
{
    global $user;
    foreach ($user as $key => $value) {
        if (!isset($_POST[$key])) $_POST[$key] = $value;
    }

    return isset($_POST[$name]) ? $_POST[$name] : '';
}

require_once 'components/header.php';

?>

<main>
    <div class="container">
        <section class="cabinet">
            <h1><i class="material-icons-outlined">badge</i> <?= $user['name'] ?></h1>
            <div class="info">
                <p><i class="material-icons-outlined">email</i> <?= $user['email'] ?></p>
            </div>
            <?php if (Db::app()->isAdmin()) { ?>
                <a href="admin.php" class="btn">Перейти в панель администратора</a>
            <?php } ?>
            <form class="edit" method="POST">
                <h1>Изменить данные</h1>
                <div class="form-group">
                    <label for="email">Электронная почта</label>
                    <input type="email" name="email" placeholder="example@greenwich.kz" value="<?= value('email') ?>" maxlength="255" />
                    <p class="error"><?= error('email') ?></p>
                </div>
                <div class="form-group">
                    <label for="name">Имя</label>
                    <input type="text" name="name" value="<?= value('name') ?>" maxlength="30" />
                    <p class="error"><?= error('name') ?></p>
                </div>
                <div class="form-group">
                    <label for="password">Новый пароль</label>
                    <input type="password" name="password" value="<?= value('password') ?>" maxlength="60" />
                    <p class="error"><?= error('password') ?></p>
                </div>
                <div class="form-group">
                    <label for="passwordConfirm">Подтверждение пароля</label>
                    <input type="password" name="passwordConfirm" value="<?= value('passwordConfirm') ?>" />
                    <p class="error"><?= error('passwordConfirm') ?></p>
                </div>
                <?php if (isset($_GET['edited'])) { ?>
                    <div class="form-group">
                        <div class="alert">
                            Данные изменены
                        </div>
                    </div>
                <?php } ?>
                <div class="form-group">
                    <button class="btn with-icon" type="submit" name="change">
                        <i class="material-icons-outlined icon">edit</i>
                        Изменить
                    </button>
                </div>
            </form>
            <div>
                <a href="logout.php" class="btn with-icon">
                    <i class="material-icons-outlined icon">logout</i>
                    Выйти из аккаунта</a>
            </div>
        </section>
    </div>
</main>

<?php require_once 'components/footer.php' ?>