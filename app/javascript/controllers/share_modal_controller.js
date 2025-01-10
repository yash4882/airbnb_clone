import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    copyLink() {
        navigator.clipboard.writeText(this.element.dataset.shareUrl).then(() => {
            alert("Copied to clipboard");
        }).catch(() => {
            alert("Failed to copy the link");
        });
    }

    whatsappShare() {
        window.open(`https://web.whatsapp.com/send?text=${encodeURIComponent(this.element.dataset.shareUrl)}`);
    }

    twitterShare() {
        const url = encodeURIComponent(this.element.dataset.shareUrl);
        const text = encodeURIComponent("Check this out!");
        window.open(`https://twitter.com/intent/tweet?url=${url}&text=${text}`);
    }

    facebookShare() {
        const url = encodeURIComponent(this.element.dataset.shareUrl);
        window.open(`https://www.facebook.com/sharer/sharer.php?u=${url}`);
    }

    emailShare() {
        const url = encodeURIComponent(this.element.dataset.shareUrl);
        const subject = encodeURIComponent("Check this out!");
        const body = encodeURIComponent(`I found something interesting: ${url}`);
        window.open(`mailto:?subject=${subject}&body=${body}`);
    }

    embedLink() {
        const embedCode = `<iframe src="${this.element.dataset.shareUrl}" width="600" height="400" frameborder="0"></iframe>`;
        navigator.clipboard.writeText(embedCode).then(() => {
            alert("Embed code copied to clipboard");
        }).catch(() => {
            alert("Failed to copy embed code");
        });
    }

    messengerShare() {
        const url = encodeURIComponent(this.element.dataset.shareUrl);
        window.open(`https://www.facebook.com/dialog/send?link=${url}&app_id=YOUR_APP_ID&redirect_uri=${url}`);
    }

    messagesShare() {
        const url = encodeURIComponent(this.element.dataset.shareUrl);
        window.open(`sms:?&body=${url}`);
    }
}
