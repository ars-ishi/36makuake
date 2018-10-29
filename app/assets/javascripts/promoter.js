$(document).on('turbolinks:load', function(){
  if (window.location.href.match(/projects\/new/)) {
    function imageUploadPreview(fieldId, imageId) {
      $(fieldId).change(
        function () {
          $(imageId).css({'background': "no-repeat center/80% url('http://image.36project.com/nothingimage.png')"});
          if (!this.files.length) {
            return;
          }
          var file = $(this).prop('files')[0];
          var fr = new FileReader();
          $(imageId).css('background-image', 'none');
          fr.onload = function() {
            $(imageId).css({'background': 'url(' + fr.result + ')', 'background-size': 'cover'});
          }
          fr.readAsDataURL(file);
        }
      );
    };
    imageUploadPreview('#project_thumbnail', '.project-thumbnail-file-preview');
    imageUploadPreview('#project_project_images_attributes_0_image', '.project-image-file-preview-0');
    imageUploadPreview('#project_project_images_attributes_1_image', '.project-image-file-preview-1');
    imageUploadPreview('#project_project_images_attributes_2_image', '.project-image-file-preview-2');
    imageUploadPreview('#project_project_images_attributes_3_image', '.project-image-file-preview-3');
    imageUploadPreview('#project_courses_attributes_0_course_images_attributes_0_image', '.course-image-file-preview');
    function inputCheck(inputId, iconId) {
      $(inputId).on('input', function() {
        if ($(inputId).val()) {
          $(iconId).css({'opacity': '1', 'color': '#f53a67'});
        } else {
          $(iconId).css({'opacity': '.6', 'color': '#bbb'});
        }
      });
    };
    inputCheck('#project_name', '#check-project_name');
    inputCheck('#project_category_id', '#check-project_category_id');
    inputCheck('#project_support_type', '#check-project_support_type');
    inputCheck('#project_support_type', '#check-project_support_type');
    inputCheck('#project_deadline_5i', '#check-project_deadline_5i');
    inputCheck('#project_target_sales', '#check-project_target_sales');
    inputCheck('#project_content', '#check-project_content');
    inputCheck('#project_thumbnail', '#check-project_thumbnail');
    inputCheck('#project_courses_attributes_0_name', '#check-project_courses_attributes_0_name');
    inputCheck('#project_courses_attributes_0_content', '#check-project_courses_attributes_0_content');
    inputCheck('#project_courses_attributes_0_price', '#check-project_courses_attributes_0_price');
    inputCheck('#project_courses_attributes_0_due_date', '#check-project_courses_attributes_0_due_date');
    inputCheck('#project_courses_attributes_0_stock', '#check-project_courses_attributes_0_stock');
    inputCheck('#project_courses_attributes_0_course_images_attributes_0_image', '#check-project_courses_attributes_0_course_images_attributes_0_image');
    $(document).ready(function(){
      $('#project_support_type').val('');
      $('#project_target_sales').val('');
      $('#project_deadline_1i').val('2019');
      $('#project_deadline_2i').val('1');
      $('#project_deadline_3i').val('1');
      $('#project_deadline_4i').val('');
      $('#project_deadline_5i').val('');
    });
  }
  if (window.location.href.match(/\/users\/\d+\/promoter_profiles/)) {
    function tabSwitch(linkId) {
      $(linkId).on('click', function() {
        $('#project-view').toggleClass('tab-area-active');
        $('#project-view').toggleClass('tab-area-inactive');
        $('#supporter-view').toggleClass('tab-area-active');
        $('#supporter-view').toggleClass('tab-area-inactive');
        $('#projects-link').toggleClass('left-area-list-active');
        $('#projects-link').toggleClass('left-area-list-inactive');
        $('#supporters-link').toggleClass('left-area-list-active');
        $('#supporters-link').toggleClass('left-area-list-inactive');
      });
    };
    tabSwitch('#supporters-link');
    tabSwitch('#projects-link');
  }
});