<?php
namespace test\Unit\models;

use Yii;
use app\models\SignupForm;
use app\models\User;

class SignupFormTest extends \Codeception\Test\Unit
{

    public function testRules()
    {
        $model = new SignupForm();

        $model->username = "dev02";
        $model->email = "dev02@mail.com";
        $model->password = "123456";
        $this->assertTrue($model->validate());

        $model->username = "12";
        $this->assertTrue($model->validate());

        $model->username = str_repeat('a', 255);
        $this->assertTrue($model->validate());

        $model->username = "1";
        $model->email = null;
        $this->assertFalse($model->validate());

        $model->username = str_repeat('a', 256);
        $this->assertFalse($model->validate());

        $model->username = null;
        $this->assertFalse($model->validate());

        $model->username = "";
        $this->assertFalse($model->validate());

        $model->username = "dev02";
        $model->validate();
        $this->assertEquals('dev02', $model->username);

        $model->username = "admin";
        $this->assertFalse($model->validate());

    }

    
    public function testSignup()
    {
        $model = new SignupForm();
//success
        $model->username = "dev02";
        $model->email = "dev02@mail.com";
        $model->password = "123456";

        $user = $model->signup();
        $this->assertNotEmpty($user->username);


        //insert to database 
        $newUser = User::findByUsername($model->username);
        $this->assertNotEmpty($newUser->username);
        
        //fail
        $model->username = "";
        $user = $model->signup();
        $this->assertNull($user);


    }
}