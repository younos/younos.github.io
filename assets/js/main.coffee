---
---

# Load data
lang = document.currentScript.getAttribute('lang')
summaries = {{ site.data.cv.summaries | jsonify }}
academic_projects = {{ site.data.cv.academic_projects | reverse | jsonify }}
hard_skills = {{ site.data.cv.hard_skills | jsonify }}

$(document).ready ->
    
    # If job type changes, update relevant information on CV
    $('#selectJobType').change ->
        selectedJobType = $(this).children('option:selected').val()
        updateSummary selectedJobType
        updateHardSkills selectedJobType
        updateProjects selectedJobType
        return

    # If click on edit/finish button, set content editable/not editable
    $('input[id=start-stop-edit]').change ->
        if ($(this).is(':checked'))
            setContentEditable(true, 'Finish')
        else 
            setContentEditable(false)
        return 

    return

###
Update the "Summary" paragraph based on the job type.
Select the paragraph for the selected job type.
###
updateSummary = (jobType) ->
    # Change summary text
    $('#summary').text(summaries[jobType]['text'][lang])
    return

###
Update the "Hard Skills" subsection based on the job type.
Select the relevant skills for the selected job type.
###
updateHardSkills = (jobType) ->
    # Remove all skills in list
    $('#hard-skills').empty()
    # Add the skills
    for skill in hard_skills[jobType]
        $('#hard-skills').append("<li>#{skill[lang]}</span>")
    return

###
Update the "Academic Projects" subsection based on the job type.
Select the relevant projects for the selected job type.
###
updateProjects = (jobType) ->
    # Declare data
    spiral_calendar = '<img class="emoji" title=":spiral_calendar:" alt=":spiral_calendar:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f5d3.png">'
    school = '<img class="emoji" title=":school:" alt=":school:" src="https://github.githubassets.com/images/icons/emoji/unicode/1f3eb.png">'
    # Remove all projects
    $('#academic-projects').empty()
    # Loop over projects for selected jobType and add them to the div
    for project in academic_projects
        if jobType in project.types
            html = """
                   <h3 class="editable">#{project.title[lang]}</h3>
                   <h4 class="editable">#{project.description[lang]}</h4>
                   <h5 class="editable">#{spiral_calendar} #{project.period}&nbsp;&nbsp;&nbsp;#{school} #{project.school[lang]}</h5>
                   <ul class="task-list editable">
                     <li>Tools: #{project.tools.join(", ")}</li>
                   </ul>
                   """
            $('#academic-projects').append(html)
    return

###
Change edit button text and enable/disable print button.
Find all tag with class .editable and change the attribute 'contenteditable' to value.
Toggle 'filled' attribute of .level-circle divs.
###
setContentEditable = (value, text='Edit') ->
    $('input[id=start-stop-edit]').parent().children('span').text(text)
    $('#print').prop('disabled', value)
    $('#cv-container').find('.editable').each ->
        $(this).prop('contenteditable', value)
        return
    $('#languages').find('.level-circle').each ->
        if value
            $(this).on('click', toggleFilledAttribute)
        else
            $(this).off('click', toggleFilledAttribute)
        return
    return

###
Toggle "filled" attribute.
###
toggleFilledAttribute = () ->
    filled = $(this).attr('filled') == 'true'
    $(this).attr('filled', !filled);
    return