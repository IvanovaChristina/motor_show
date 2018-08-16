<#import "parts/common.ftl" as c>

<@c.page>


    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="post">
                <input type="text" name="text" placeholder="Оставьте отзыв"/>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-secondary ml-3" type="submit">Добавить</button>
            </form>
        </div>
    </div>

    <#list reviews as review>
<div class="card my-1" style="width: 18rem;">
    <span>${review.text_review}</span>
    <i>${review.authorName}</i>
</div>
    <#else>
Пока нет отзывов
    </#list>

</@c.page>