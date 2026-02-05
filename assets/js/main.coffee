---
---

# Load data
lang = document.currentScript.getAttribute('lang')
summaries = {{ site.data.cv.summaries | jsonify }}
academic_projects = {{ site.data.cv.academic_projects | reverse | jsonify }}
core_skills = {{ site.data.cv.core_skills | jsonify }}

$(document).ready ->
    
    # If job type changes, update relevant information on CV
    $('#selectJobType').change ->
        selectedJobType = $(this).children('option:selected').val()
        updateSummary selectedJobType
        updateCoreSkills selectedJobType
        updateProjects selectedJobType
        return

    # If click on edit/finish button, set content editable/not editable
    $('button[id=start-stop-edit]').click ->
        if ($(this).attr('aria-pressed') == 'true')
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
Update the "Core Skills" subsection based on the job type.
Select the relevant skills for the selected job type.
###
updateCoreSkills = (jobType) ->
    # Remove all skills in list
    $('#core-skills').empty()
    # Add the skills
    for skill in core_skills[jobType]
        $('#core-skills').append("<li>#{skill[lang]}</span>")
    return

###
Update the "Academic Projects" subsection based on the job type.
Select the relevant projects for the selected job type.
###
updateProjects = (jobType) ->
    # Declare data
    calendar = '<i class="bi bi-calendar-date"></i>'
    school = '<i class="bi bi-bank"></i>'
    # Remove all projects
    $('#academic-projects').empty()
    # Loop over projects for selected jobType and add them to the div
    for project in academic_projects
        if jobType in project.types
            html = """
                   <h3 class="editable">#{project.title[lang]}</h3>
                   <h4 class="editable">#{project.description[lang]}</h4>
                   <h5>
                       <div class="editable">#{calendar} #{project.period}</div>
                       <div class="editable">#{school} #{project.school[lang]}</div>
                   </h5>
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
    $('button[id=start-stop-edit]').text(text)
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