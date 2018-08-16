<#include "security.ftl">
<#import "login.ftl" as l>
<img src="http://old.bmw-angara.ru/media/owners/special/auto/092016_6_1024x291_header.jpg" width="1400" height="300"
     alt="">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <a class="navbar-brand" href="/">Автосалон</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/auto">Главная</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/review">Отзывы</a>
            </li>
            <#if isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/main">Список автомобилей</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user">Список пользователей</a>
            </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">${name}</div>

        <@l.logout />
    </div>
</nav>