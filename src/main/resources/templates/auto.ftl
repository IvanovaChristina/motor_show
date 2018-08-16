<#import "parts/common.ftl" as c>

<@c.page>


<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" value="${filter?ifExists}" placeholder="Искать по марке...">
            <button class="btn btn-secondary ml-3" type="submit">Поиск</button>
        </form>
    </div>
</div>

    <p>Автомобили в наличии</p>

    <#list cars as car>
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <div>
                <#if car.filename??>
                    <img src="/image/${car.filename}">
                </#if>
                </div>
                <span>${car.brand}</span>
                <i>${car.model}</i>
                <i>${car.color}</i>
                <b>${car.price}</b>

            </div>
        </div>
    <#else>
Нет доступных автомобилей
    </#list>

</@c.page>