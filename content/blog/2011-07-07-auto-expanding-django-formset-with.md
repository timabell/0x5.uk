---
layout: post
title: Auto-expanding django formset with jQuery
date: '2011-07-07T23:02:00.009Z'
author: Tim Abell
tags:
- howto
- dhtml
- django
- code
- jQuery
modified_time: '2011-07-08T23:00:55.354Z'
blogger_id: tag:blogger.com,1999:blog-5082828566240519947.post-1390054549969590161
blogger_orig_url: https://timwise.blogspot.com/2011/07/auto-expanding-django-formset-with.html
---

As it took me quite a while to get it how I like it, here's the relevant bits for making a django formset (custom markup in a table), that automatically adds rows (formset forms) client-side / in the browser keeping up as you fill in the form.  

Do with the code as you wish, no licence needed.  

In the view (.html file server side) I have:  

    @login_required
    def invoiceEdit(request, invoice_id):
        ...
        InlineInvoiceItemsFormSet = inlineformset_factory(Invoice, InvoiceItem, form=DeleteIfEmptyModelForm, formset=DeleteIfEmptyInlineFormSet, can_delete=True, extra=10)
        ...
        itemFormSet = InlineInvoiceItemsFormSet()
        ...
        return render_to_response('foo/edit.html', {'invoiceForm': invoiceForm, 'itemFormSet': itemFormSet, 'invoice': invoice}, context_instance=RequestContext(request))

In the template I have:  

    <script type="text/javascript">
     $(function() {
      setupInvoiceFormset();
     });

     var initialRows;

     function setupInvoiceFormset() {
      initialRows = parseInt($('#id_invoiceitem_set-INITIAL_FORMS').val());
      // remove all but last two empty rows
      resizeInvoiceFormset();
      // add handlers to all inputs to automate row adding
      $('.invoiceItemRow :input').blur(resizeInvoiceFormset);
     }

     const targetExtra = 2; // number of extra rows desired

     function resizeInvoiceFormset() {
      // count the blank rows at the end
      var rows = $('.invoiceItemRow').filter(':not(#templateItemRow)');
      var totalRows = rows.length
      var blankRows = countBlankRows(rows);
      var targetRowCount = totalRows - blankRows + targetExtra;
      targetRowCount = Math.max(targetRowCount,initialRows); // don't trim off real rows otherwise delete breaks
      if (totalRows > targetRowCount) {
       // if there too many blank rows remove the extra rows
       rows.slice(targetRowCount).remove(); // negative to strip from ends
      } else if (totalRows < targetRowCount) {
       // add new blank rows to bring the total up to the desired number
       for (var newRowIndex = totalRows; newRowIndex < targetRowCount; newRowIndex++) {
        addRow(newRowIndex);
       }
      } else {
       return;
      }
      // update the hidden form with the new form count
      $('#id_invoiceitem_set-TOTAL_FORMS').val(targetRowCount);
     }

     function countBlankRows(rows) {
      // count the empty rows from the bottom up, stopping at the first non-blank row
      var blankRows = 0;
      for (var i = rows.length -1; i>=0; i--) {
       if (isEmptyRow(rows[i])) {
        blankRows++;
       } else {
        break;
       }
      }
      return blankRows;
     }

     function isEmptyRow(row) {
      // loop through all the inputs in the row, return true if they are all blank
      // whitespace is ignored
      var inputs = $(row).find(':input').filter(':not(:hidden)');
      for (var j = 0; j < inputs.length; j++) {
       if ($.trim(inputs[j].value).length) {
        return false;
       }
      }
      return true;
     }

     function addRow(newRowIndex) {
      var newRow = $('#templateItemRow').clone(true);
      newRow.addClass('invoiceItemRow');
      newRow.removeAttr('id'); //prevent duplicated template row id
      newRow.show();
      // replace placeholder with row index
      newRow.find(':input').each(function() {
       $(this).attr("name", $(this).attr("name").replace('__prefix__', newRowIndex));
       $(this).attr("id", $(this).attr("id").replace('__prefix__', newRowIndex));
      });
      $('.invoiceItemRow:last').after(newRow);
     }
    </script>
    ...
    {{ itemFormSet.management_form }}
    <tr id="templateItemRow" class="invoiceItemRow" style="display: none;">
     <td><strong>Item:</strong></td>
     <td>
      {{ itemFormSet.empty_form.id }}
      {{ itemFormSet.empty_form.description }}
      {{ itemFormSet.empty_form.description.errors }}</td>
     <td class="price">£{{ itemFormSet.empty_form.price }} {{ itemFormSet.empty_form.price.errors }}</td></tr>
    {% for item in itemFormSet.forms %}
    <tr class="invoiceItemRow">
     <td><strong>Item:</strong></td>
     <td>
      {{ item.id }}
      {{ item.description }}
      {{ item.description.errors }}</td>
     <td class="price">£{{ item.price }} {{ item.price.errors }}</td></tr>
    {% endfor %}
    ...

The result is a form that intuitively shrinks/grows as the content is added/removed.  

The javascript is of course actually in a separate .js file.  

References:  

*   [https://docs.djangoproject.com/en/dev/topics/forms/formsets/](https://docs.djangoproject.com/en/dev/topics/forms/formsets/)
*   [http://api.jquery.com/](http://api.jquery.com/)

Footnote. You may have noticed the delete-if-empty customisation which I like for usability. References for this at  

*   [http://pastebin.com/f40a3bde9](http://pastebin.com/f40a3bde9)
*   [http://groups.google.com/group/django-users/browse_thread/thread/9e26cf3ab1d1fcb1?tvc=2](http://groups.google.com/group/django-users/browse_thread/thread/9e26cf3ab1d1fcb1?tvc=2)
*   [http://groups.google.com/group/django-users/browse_thread/thread/23539f5e085e62b0](http://groups.google.com/group/django-users/browse_thread/thread/23539f5e085e62b0)
