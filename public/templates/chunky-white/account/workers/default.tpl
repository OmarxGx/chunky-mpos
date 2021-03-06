<article class="widget col-md-4 push-right">
  <header><h3 class="">Add New Worker</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post" class="form-horizontal">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="add">
    <div class="module_content">
      <fieldset>
      <div class="control-group">
        <label class="control-label">Worker Name</label>
        <div class="controls form-group">
          <input type="text" name="username" value="user" size="10" maxlength="20" required>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label">Worker Password</label>
        <div class="controls form-group">
          <input type="text" name="password" value="password" size="10" maxlength="20" required>&nbsp;
        </div>
      </div>
      </fieldset>
      <div class="clear"></div>
    </div>
    <footer>
      <div class="submit_link">
        <input type="submit" value="Add New Worker" class="btn btn-primary">
      </div>
    </footer>
  </form>
</article>

<article class="widget col-md-7">
  <header><h3 class="">Worker Configuration</h3></header>
  <form action="{$smarty.server.PHP_SELF}" method="post" class="form-horizontal">
    <input type="hidden" name="page" value="{$smarty.request.page|escape}">
    <input type="hidden" name="action" value="{$smarty.request.action|escape}">
    <input type="hidden" name="do" value="update">
    <table class="table" cellspacing="0">
      <thead>
        <tr>
          <th align="left">Worker Login</th>
          <th align="left">Worker Password</th>
          <th align="center">Active</th>
          {if $GLOBAL.config.disable_notifications != 1}<th align="center">Monitor</th>{/if}
          <th align="right">Khash/s</th>
          <th align="right">Difficulty</th>
          <th align="center" style="padding-right: 25px;">Action</th>
        </tr>
      </thead>
      <tbody>
        {nocache}
          {section worker $WORKERS}
          {assign var="username" value="."|escape|explode:$WORKERS[worker].username:2} 
        <tr>
          <td align="left"{if $WORKERS[worker].hashrate > 0} style="color: orange"{/if}>{$username.0|escape}.<input name="data[{$WORKERS[worker].id}][username]" value="{$username.1|escape}" size="10" required/></td>
          <td align="left"><input type="text" name="data[{$WORKERS[worker].id}][password]" value="{$WORKERS[worker].password|escape}" size="10" required></td>
          <td align="center"><i class="fa fa-{if $WORKERS[worker].hashrate > 0}check{else}fa-times-circle{/if}"></i></td>
          {if $GLOBAL.config.disable_notifications != 1}
          <td>
            <span class="toggle">
            <label for="data[{$WORKERS[worker].id}][monitor]">
            <input type="checkbox" class="ios-switch" name="data[{$WORKERS[worker].id}][monitor]" value="1" id="data[{$WORKERS[worker].id}][monitor]" {if $WORKERS[worker].monitor}checked{/if} />
            <div class="switch"></div>
            </label>
            </span>
          </td>
          {/if}
          <td align="right">{$WORKERS[worker].hashrate|number_format}</td>
          <td align="right">{$WORKERS[worker].difficulty|number_format:"2"}</td>
          <td align="center" style="padding-right: 25px;"><a href="{$smarty.server.PHP_SELF}?page={$smarty.request.page|escape}&action={$smarty.request.action|escape}&do=delete&id={$WORKERS[worker].id|escape}" class="icn_trash"><i class="fa fa-ban" /></a></td>
        </tr>
          {/section}
        {/nocache}
      </tbody>
    </table>
    <div class="clear"></div>
    <footer>
      <div class="submit_link">
        <input type="submit" class="btn btn-primary" value="Update Workers">
      </div>
    </footer>
  </form>
</article>
