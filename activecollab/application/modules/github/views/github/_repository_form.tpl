{wrap field=name}
  {label for=repositoryName required=yes}{lang}Name{/lang}{/label}
  {text_field name='repository[name]' value=$repository_data.name id=repositoryName class='title required'}
{/wrap}

{wrap field=url aid="$aid_url"}
  {label for=repositoryUrl required=yes}{lang}URL of Github Repository Page (e.g. https://github.com/UCF/Today):{/lang}{/label}
  {text_field name='repository[url]' value=$repository_data.url id=repositoryUrl class='title required'}
{/wrap}

<p><strong>Is this a private repository?</strong></p>
<input type="checkbox" id="private_repo" />
<div id="private_repo_creds">
	<div class="col">
		{wrap field=username}
		  {label for=repositoryUsername required=yes}{lang}Username (not organization name):{/lang}{/label}
		  {text_field name='repository[username]' style='width:250px' value=$repository_data.username id=repositoryUsername class='title'}
		{/wrap}
	</div>
	<div class="col">
		{wrap field=key}
		  {label for=repositoryKey required=no}{lang}API Token:{/lang}{/label}
		  {text_field name='repository[key]' style='width:250px' value=$repository_data.key id=repositoryKey class='title'}
		{/wrap}
	</div>
	<div class="clear"></div>
	<p><em>You can find your API Token on the Account Settings > Account Admin page of the Github website.</em></p>
</div>

<div class="clear"></div>
{if $logged_user->canSeePrivate()}
  {wrap field=visibility}
    {label for=repositoryVisibility}Visibility{/label}
    {select_visibility name=repository[visibility] value=$repository_data.visibility project=$active_project}
  {/wrap}
{else}
  <input type="hidden" name="repository[visibility]" value="1"/>
{/if}