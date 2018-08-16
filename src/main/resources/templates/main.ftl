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

 <a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
    aria-controls="collapseExample">
     Добавить автомобиль
 </a>
<div class="collapse" id="collapseExample">
    <form method="post" enctype="multipart/form-data">
        <div class="form-group mt-3">
            <input type="text" class="form-control" name="text_brand" placeholder="Введите бренд"/>
            <input type="text" class="form-control" name="text_model" placeholder="Введите модель"/>
            <input type="text" class="form-control" name="text_color" placeholder="Введите цвет"/>
            <input type="text" class="form-control" name="text_equipment" placeholder="Введите комплектацию"/>
            <input type="text" class="form-control" name="text_options" placeholder="Введите опции"/>
            <input type="number" class="form-control" name="text_price" placeholder="Введите цену"/>
            <input type="file" class="form-control" name="file"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button class="btn btn-secondary mt-3" type="submit">Добавить</button>
    </form>
</div>
</div>

    <div>Автомобили в наличии</div>

    <#list cars as car>
        <div>
            <span>${car.brand}</span>
            <i>${car.model}</i>
            <i>${car.color}</i>
            <b>${car.price}</b>
            <div>
                <#if car.filename??>
                    <img src="/image/${car.filename}">
                </#if>
            </div>
        </div>
    <#else>
Нет доступных автомобилей
    </#list>

</@c.page>