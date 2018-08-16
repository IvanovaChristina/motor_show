<#macro login path isReg>
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Имя :</label>
        <div class="col-sm-5">
            <input type="text" name="username" class="form-control"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Пароль: </label>
        <div class="col-sm-5">
            <input type="password" name="password" class="form-control"/>
        </div>
    </div>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#if !isReg><a href="/registration">Регистрация</a></#if>
    <button class="btn btn-secondary" type="submit"><#if isReg>Зарегистрироваться<#else>Войти</#if></button>
</form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-secondary" type="submit">Выход</button>
    </form>
</#macro>