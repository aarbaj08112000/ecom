$(function () {
    const $modal = $('#editSettingModal');
    const $form = $('#editSettingForm');
    const $container = $('#dynamicInputContainer');
    const $saveBtn = $('#saveSettingBtn');
    const $spinner = $saveBtn.find('.spinner-border');

    $('.edit-setting').on('click', function () {
        const $card = $(this).closest('.setting-card');
        const name = $card.data('name');
        const type = $card.data('type');
        const title = $card.data('title');
        let value = '';

        if (type === 'check_box') {
            value = $card.find('.badge').text().trim();
        } else if (type === 'textarea') {
            value = $card.find('.setting-value-display > div').text().trim();
        } else if (type === 'input') {
            value = $card.find('.setting-value-display > div').text().trim();
        }

        $('#modalSettingTitle').text('Edit ' + title);
        $('#settingName').val(name);
        $('#settingType').val(type);

        renderDynamicField(type, value);
        $modal.modal('show');
    });

    function renderDynamicField(type, value) {
        $container.empty();
        let html = '';

        switch (type) {
            case 'input':
                html = `<div class="mb-3">
                            <label class="form-label">Value</label>
                            <input type="text" name="value" class="form-control" value="${value}" required>
                        </div>`;
                break;
            case 'textarea':
                html = `<div class="mb-3">
                            <label class="form-label">Value</label>
                            <textarea name="value" class="form-control" rows="4" required>${value}</textarea>
                        </div>`;
                break;
            case 'file':
                html = `<div class="mb-3">
                            <label class="form-label">Upload File</label>
                            <input type="file" name="value" class="form-control" accept="image/*,.pdf,.doc,.docx" required>
                            <div class="form-text">Supported: JPG, PNG, GIF, ICO, SVG, PDF, DOC, DOCX</div>
                        </div>`;
                break;
            case 'check_box':
                const isYes = value === 'Yes' ? 'checked' : '';
                const isNo = value === 'No' ? 'checked' : '';
                html = `<div class="mb-3">
                            <label class="form-label d-block">Value</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="value" id="radioYes" value="Yes" ${isYes}>
                                <label class="form-check-label" for="radioYes">Yes</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="value" id="radioNo" value="No" ${isNo}>
                                <label class="form-check-label" for="radioNo">No</label>
                            </div>
                        </div>`;
                break;
        }

        $container.append(html);
    }

    $form.on('submit', function (e) {
        e.preventDefault();
        const formData = new FormData(this);

        $saveBtn.prop('disabled', true);
        $spinner.removeClass('d-none');

        $.ajax({
            url: 'update_setting',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (response) {
                if (response.success) {
                    toaster('success', response.messages);
                    $modal.modal('hide');
                    setTimeout(() => location.reload(), 2000);
                } else {
                    toaster('error', response.messages);
                }
            },
            error: function () {
                toaster('error', 'Something went wrong. Please try again.');
            },
            complete: function () {
                $saveBtn.prop('disabled', false);
                $spinner.addClass('d-none');
            }
        });
    });
});
